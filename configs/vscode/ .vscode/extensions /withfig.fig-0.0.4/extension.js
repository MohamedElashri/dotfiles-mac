const vscode = require('vscode');
const cp = require('child_process')

let runCommand = function (command) {
	cp.exec(command, (err, stdout, stderr) => {
		if (err) {
			logError(err);
		}
	});
}

// fig.log is an internal setting as it's intended for developers only, this means it won't show up
// in the settings UI/editor. Add `"fig.log": true` to your settings.json and reload the window to
// enable logging.
let shouldLog = vscode.workspace.getConfiguration().get('fig.log') === true;

function log(...args) {
	if (shouldLog) {
		console.log(`fig: ${args[0]}`, args.slice(1));
	}
}

function logError(message) {
	console.error(`fig: ${message}`);
}

function updateActiveTerminal(terminal) {
	let activeTerminal = terminal || vscode.window.activeTerminal

	if (!activeTerminal) {
		noActiveTerminals()
		return
	}
	activeTerminal.processId.then((processId) => {
		if (processId) {
			runCommand('fig bg:vscode code:' + processId)
		}
	})
}

function noActiveTerminals() {
	runCommand('fig bg:vscode-no-active-terminals')
}


function activate(context) {
	try {
		updateActiveTerminal()

		vscode.window.onDidOpenTerminal(terminal => {
			log("Terminal opened. Total count: " + vscode.window.terminals.length);
		});

		vscode.window.onDidCloseTerminal(terminal => {
			log("Terminal closed. Total count: " + vscode.window.terminals.length);

			if (vscode.window.terminals.length == 0) {
				noActiveTerminals()
			} else {
				updateActiveTerminal()
			}
		});

		vscode.window.onDidChangeActiveTerminal(terminal => {
			log(`Active terminal changed`);
			updateActiveTerminal(terminal)
		});

	} catch (e) {
		logError(e)
	}
}
exports.activate = activate;

function deactivate() { }

module.exports = {
	activate,
	deactivate
}
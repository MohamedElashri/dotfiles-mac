
const vscode = require('vscode');
const path = require('path');
const fetch = require("node-fetch");
const jsdom = require('jsdom')
const getmac = require('getmac');


let global_questions = [];
let global_question_index = 0;
let global_last_response = null;
let global_current_language = ""
let panel = null;
let global_google_question_ids = []
let global_include_language = true
let global_delete_line = false
const intellisense_text = "StackFinder Search (CTRL + ENTER)"
let global_current_line_text = ""
let global_last_message = new Date().getTime();
let global_rating = 0





async function google_analytics(event_name){
	try{
		const params = {
			v: 1,
			t: 'event',
			tid: 'UA-19034238-5',
			cid: callMac(),
			ec: 'general',
			el: global_current_language,
			ea: event_name
		};
	
		let url = 'https://www.google-analytics.com/collect' + '?' + ( new URLSearchParams( params ) ).toString();
	
		fetch(url);
	}catch(err){
	}
}


async function get_json_stackoverflow(base_url, params){
	base_url += '?' + ( new URLSearchParams( params ) ).toString();

	const res = await fetch(base_url)
	const json = await res.json()
	return json
}

function string_replacements_stack(post){
	return post.replaceAll("<code>", "")
							.replaceAll("</code>", "")
							.replaceAll("&gt;", ">")
							.replaceAll("&lt;", "<")
							.replaceAll(">>> ", "")
							.replaceAll(">>>", "")
							

}

function process_code_stack(post){
	return post.replaceAll("<pre><code>", '<button class="btn btn-send-to-editor">SEND TO EDITOR</button><br><pre><code>')

}

async function set_global_stack_questions_response(title){
	
	let lang_tag = ""

	if(global_include_language){
		lang_tag = global_current_language
	}

	const params = {
		order: 'desc',
		sort: 'relevance',
		title: title,
		site: 'stackoverflow',
		tagged: lang_tag,
		filter: '!6VvPDzQ)wlg1u',
		key: 'x50f*DV4VX2ZzPIuvA)BmQ(('
	};

	let url = 'https://api.stackexchange.com/2.3/similar'
	global_last_response = await get_json_stackoverflow(url, params)


	global_question_index = 0;

	try{
		for(var question_i in global_last_response['items']){
			let question = global_last_response['items'][question_i]
			if(question['is_answered']){
				global_questions.push(question)
			}
		}
	}catch(err){}
}


async function set_global_stack_questions_response_from_google(){
	const params = {
		order: 'desc',
		sort: 'votes',
		site: 'stackoverflow',
		filter: '!0WAfAJuE9sj2eV3niM7p--bjL',
		key: 'x50f*DV4VX2ZzPIuvA)BmQ(('
	};


	let url = 'https://api.stackexchange.com/2.3/questions/'

	for(let i = 0; i < global_google_question_ids.length; i++){
		if(i==0){
			url +=  global_google_question_ids[i]
		}else{
			url += ";" + global_google_question_ids[i]
		}
	}

	

	global_last_response = await get_json_stackoverflow(url, params)
	global_question_index = 0;

	for (let i = 0; i < global_google_question_ids.length; i++) {
		let tmp_question_id = global_google_question_ids[i]

		for(var question_i in global_last_response['items']){
			let question = global_last_response['items'][question_i]
			if (question['question_id'] == tmp_question_id){
				if(question['is_answered']){
					global_questions.push(question)
				}
			}
		}
	} 

	
}



async function build_html_body(logoSrc){
	
	let html = '<div style="text-align:center"> <img style="margin-top:10px; margin-bottom:10px; width:200px;" src="'+logoSrc+'">'

	try{
		if (global_last_response['quota_remaining'] < 5000){
			html += '<h3>Searches left: ' + global_last_response['quota_remaining'].toString() + ' / ' + global_last_response['quota_max'].toString() + '</h3>'
		}

		if (global_google_question_ids.length==0){
			html += '<h6 style="color:gray">Content sourced from the <a style="color:gray" href="https://stackexchange.com/">Stack Exchange Network</a></a></h6></div><hr>'
		}else{
			html += '<h6 style="color:gray">Content sourced from the <a style="color:gray" href="https://stackexchange.com/">Stack Exchange Network</a> and <a style="color:gray" href="https://google.com/">Google</a></h6>'
		}


		const CTAs = [
			// '<h4>Like this extension? Please consider <a href="https://www.buymeacoffee.com/markfobert">buying me a coffee.</a></h4>',
			`<h4>Please share this extension: 
			<a class="share" href="https://twitter.com/intent/tweet?text=I found a great %23vscode Extension by @MarkFobert%0A%0AStackFinder: A tool for finding StackOverflow answers and pasting them into your code.%0A%0A&url=marketplace.visualstudio.com%2Fitems%3FitemName%3Dmark-fobert.stackfinder&hashtags=vscode%2Cproductivity%2CStackOverflow%2Cdeveloper">Twitter</a> 
			<a class="share" href="https://www.facebook.com/sharer/sharer.php?u=marketplace.visualstudio.com%2Fitems%3FitemName%3Dmark-fobert.stackfinder" target="_blank">Facebook</a> 
			<a class="share" href="https://www.linkedin.com/sharing/share-offsite/?url=marketplace.visualstudio.com%2Fitems%3FitemName%3Dmark-fobert.stackfinder">LinkedIn</a>
			</h4>`,
			`<h4>Please <a class="rate" href="https://marketplace.visualstudio.com/items?itemName=mark-fobert.stackfinder&ssr=false#review-details">rate this extension</a></h4>`,
		]

		const randomCTA = CTAs[Math.floor(Math.random() * CTAs.length)];

		html += randomCTA
		
		html += `
		<h5> Include current language in future searches (${global_current_language})?:
		<label class="switch">
			<input id="include_lang" type="checkbox" ${(global_include_language==true)? "checked":""} >
			<span class="slider round"></span></h5>
		</label>
		`
		

		// html += `
		// <h5> Delete code line on activation?: 
		// <label class="switch">
		// 	<input id="delete_line" type="checkbox" ${(global_delete_line==true)? "checked":""} >
		// 	<span class="slider round"></span>
		// </label></h5>
		// `
		
		html += `
		<h5> Search Results For: "${global_current_line_text}" </h5>
		</div><hr>
		`


	}catch(err){}

	if (global_questions.length == 0) {
		html += '<div style="text-align:center">'
		html += '<h3>No Results Found</h3>';
		html += '<h4>Try refining your search</h4>';
		html += '</div>'
		return html;
	}

	let question = global_questions[global_question_index]

	let date = new Date(parseInt(question['creation_date']) * 1000)
	html += '<div style="position:relative;text-align:center">'

	html += '<h3 style="display:inline-block;margin-bottom:5px"><a style="color:white" href="' + question['link'] + '">' + question['title'] + "</a></h3>"

	html += '<h5 >Asked by <a style="color:white" href="' + question['owner']['link'] + '">' + question['owner']['display_name'] + "</a> on " + date.toDateString() + " </h5>"

	if(global_question_index > 0){
		html += '<button class="btn btn-previous-page" style="display:inline-block;margin-right:10px;font-size:1.5rem"> &lt;&lt; </button>'
	}else{
		html += '<button class="btn btn-previous-page" style="display:inline-block;margin-right:10px;font-size:1.5rem;visibility:hidden"> &lt;&lt; </button>'
	}

	if(global_questions.length > 1){
		html += '<button class="btn btn-show-results" style="display:inline-block;margin-right:5px;margin-left:5px;font-size:1.5rem"> = </button>'
	}


	html += '<div id="title_popup" style="display:none;position:absolute;padding:20px;margin-left:auto;margin-right:auto;background:rgba(0, 0, 0, 0.9); border-radius: 10px; width: 80%;left:10%;right:10%;z-index:100;">'
	for(var question_i in global_questions){
		let tmp_question = global_questions[question_i]
		html += '<h4><a id="' + question_i.toString() + '" class="question" href="#">' + tmp_question['title'] + '</a></h4>'
	}
	html += '</div>'

	if(global_question_index < global_questions.length - 1){
		html += '<button class="btn btn-next-page" style="display:inline-block;margin-left:10px;font-size:1.5rem"> &gt;&gt; </button>'
	}else{
		html += '<button class="btn btn-next-page" style="display:inline-block;margin-left:10px;font-size:1.5rem;visibility:hidden"> &gt;&gt; </button>'
	}

	html += '</div>'


	html += process_code_stack(question['body'].toString()) + "<br><hr>"

	for(var answer_i in question['answers']){
		let answer = question['answers'][answer_i]
		date = new Date(parseInt(answer['creation_date']) * 1000)
		html += '<div style="text-align:center"><h5>Answered by <a style="color:white" href="' + answer['owner']['link'] + '">' + answer['owner']['display_name'] + "</a> on " + date.toDateString() + " </h5></div>"
		html += process_code_stack(answer['body'].toString()) + "<br><hr>"
	}

	const {JSDOM} = jsdom;
	const dom = new JSDOM(html.toString());
	const $ = (require('jquery'))(dom.window);
	
	const code_blocks = ($('pre'))

	for (let i = 0; i < code_blocks.length; i++) {
		const code_block = code_blocks[i]
		$(code_block).clone().css('display', 'none').attr('class','nohighlight').insertBefore( $(code_block) )
	} 

	html = $('body').html()
	return html.toString();
}


function create_panel(){
	panel = vscode.window.createWebviewPanel(
		'stackFinder', 
		'StackFinder', 
		vscode.ViewColumn.Two, 
		{
			enableScripts: true
		} 
	);	
}

	//authorization https://stackoverflow.com/oauth/dialog?client_id=20721&scope=no_expiry&redirect_uri=https://stackoverflow.com/oauth/login_success

	
	const callMac = () =>{
    return getmac.default().toString()
	}


/**
 * @param {vscode.ExtensionContext} context
 */
async function activate(context) {
	
	let disposable = vscode.commands.registerCommand('stackfinder.search', async function () {


    let activeEditor = vscode.window.activeTextEditor;
    if (!activeEditor) { return; }

		global_current_language = activeEditor.document.languageId
		align_languages()


		
		google_analytics('search')

		//edit text in console
		let line_start = activeEditor.document.lineAt(activeEditor.selection.active.line);
		const line_number_start = line_start.lineNumber;

		let selection_current_line = new vscode.Selection(line_number_start, line_start.range.start.character, 
			line_number_start, line_start.range.end.character)
		
		
		global_current_line_text = activeEditor.document.getText(selection_current_line).replace(intellisense_text, "");

		// activeEditor.selection = selection_current_line;

		if(global_delete_line){
			activeEditor.selection = selection_current_line;
			activeEditor.edit(editBuilder => {
				editBuilder.replace(selection_current_line, "");
			});
		}else{
			//remove "StackFinder Search (CTRL + ENTER)"
			activeEditor.edit(editBuilder => {
				editBuilder.replace(selection_current_line, global_current_line_text);
			});
		}

		//remove comments from search results
		global_current_line_text = global_current_line_text
							.replace(/^\s\s*/, '')     // Remove Preceding white space
							.replace(/\s\s*$/, '')     // Remove Trailing white space

		while(global_current_line_text[0] == '#' || 
					global_current_line_text[0] == '/' ||
					global_current_line_text[0] == '!' ||
					global_current_line_text[0] == '--' ||
					global_current_line_text[0] == "'") {
			global_current_line_text = global_current_line_text.substring(1)
		}
		global_current_line_text.replace("<!--", "")
		global_current_line_text.replace("-->", "")

		if(panel == null){
			create_panel()
		}

		if(panel._store._isDisposed){
			create_panel()
		}
	  
		const logoPath = vscode.Uri.file(
			path.join(context.extensionPath, 'StackFinderLogo.png')
		);
		
		const logoSrc = panel.webview.asWebviewUri(logoPath);

		
		await get_google_results(global_current_line_text)
		global_questions = [];

		if (global_google_question_ids.length!=0){
			await set_global_stack_questions_response_from_google()
		}else{

			await set_global_stack_questions_response(global_current_line_text)

			if(global_questions.length == 0){
				global_current_language=""
				await set_global_stack_questions_response(global_current_line_text)
			}

		}

		const stack_questions = await build_html_body(logoSrc)
		
		

		panel.webview.html = build_webview(stack_questions)

		panel.webview.onDidReceiveMessage(
			async message => {
				
				var current_time = new Date().getTime();

				if(current_time - global_last_message < 500){
					//return if messages are coming in too fast
					return
				}
				global_last_message = current_time;
			

				if(message.command == "code"){
					activeEditor.edit(edit => {
						let pos = new vscode.Position(activeEditor.selection.start.line,
							activeEditor.selection.start.character)

						activeEditor.insertSnippet(new vscode.SnippetString(string_replacements_stack("\n" + message.text)))
						google_analytics('send_code')
					});
					
					// vscode.window.activeTerminal.show();
					// vscode.window.activeTerminal.sendText("hello world", false)
				}

				if(message.command == "next_page"){
					global_question_index += 1;
					const new_html = await build_html_body(logoSrc)
					panel.webview.html = build_webview(new_html)
					};
					
				if(message.command == "previous_page"){
					global_question_index -= 1;
					const new_html = await build_html_body(logoSrc)
					panel.webview.html = build_webview(new_html)
					};

				if(message.command == "change_page"){
					global_question_index = parseInt(message.id);
					const new_html = await build_html_body(logoSrc)
					panel.webview.html = build_webview(new_html)
					};

				if(message.command == "include_lang_true"){
					global_include_language = true;

				}

				if(message.command == "include_lang_false"){
					global_include_language = false;

				}


				if(message.command == "delete_line_true"){
					global_delete_line = true;

				}


				if(message.command == "delete_line_false"){
					global_delete_line = false;

				}

				if(message.command == "rate"){
					google_analytics('rate')
				}


				if(message.command == "share"){
					google_analytics('share')
				}
			},
			undefined,
			context.subscriptions
		);


	});

	context.subscriptions.push(disposable);


	let all_langs = await vscode.languages.getLanguages()
	for(var i in all_langs){
		//make it come up for autocomplete - all languages
		context.subscriptions.push(vscode.languages.registerCompletionItemProvider (
			all_langs[i],
			{
				provideCompletionItems(document, position, token, context){
	
					let linePrefix = document.lineAt(position).text.substr(0, position.character);
					if(linePrefix.charAt(linePrefix.length - 1) == " "){
						const myHTMLCompletionItem = new vscode.CompletionItem((intellisense_text).toString());
						myHTMLCompletionItem.command = {
								title: 'StackFinder Search',
								command: 'stackfinder.search'
						};
		
						return new vscode.CompletionList([myHTMLCompletionItem]);
					} else {
						return [];
					}
				}
			},
			' ' // trigger
		));
	}
}



function deactivate() {}

module.exports = {
	activate,
	deactivate
}


function build_webview(body_content){
	return `<!DOCTYPE html>
	<html lang="en">
		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Title</title>
			<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
			
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.2.0/styles/a11y-dark.min.css">
			<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.2.0/highlight.min.js"></script>
			<script>hljs.highlightAll();</script>
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

			<style>

			a {
				color: #E7B710;
			}

			
			a:hover {
				color: #E1D89F;
			}
			

			h1, h2, h3, h4, h5, h6 {
				margin-bottom: 15px;
				margin-top: 0px;
				padding-bottom: 0px;
				padding-top: 0px;
			}

			body {
				font-size: 1.0rem;
				font-family:arial;
			}

			.btn {
				text-decoration: none;
				border: 1px solid rgb(146, 148, 248);
				position: relative;
				overflow: hidden;
				background: none;
				font-size: .70rem;
				padding: .2rem .2rem;
				color: #f4f4f4;
			}
			
			.btn:hover {
				box-shadow: 1px 1px 10px 5px rgba(146, 148, 248, 0.4);
			}
			
			.btn:before {
				content: "";
				position: absolute;
				top: 0;
				left: -100%;
				width: 100%;
				height: 100%;
				background: linear-gradient(
					120deg,
					transparent,
					rgba(146, 148, 248, 0.4),
					transparent
				);
				transition: all 650ms;
			}
			
			.btn:hover:before {
				left: 100%;
			}

			/* The switch - the box around the slider */
			.switch {
				position: relative;
				display: inline-block;
				width: 30px;
				height: 16px;
			}
			
			/* Hide default HTML checkbox */
			.switch input {
				opacity: 0;
				width: 0;
				height: 0;
			}
			
			/* The slider */
			.slider {
				position: absolute;
				cursor: pointer;
				top: 0;
				left: 0;
				right: 0;
				bottom: 0;
				background-color: #E7B710;
				-webkit-transition: .4s;
				transition: .4s;
			}
			
			.slider:before {
				position: absolute;
				content: "";
				height: 13px;
				width: 13px;
				left: 2px;
				bottom: 1px;
				background-color: white;
				-webkit-transition: .4s;
				transition: .4s;
			}
			
			input:checked + .slider {
				background-color: #06BE3A;
			}
			
			input:focus + .slider {
				box-shadow: 0 0 1px #06BE3A;
			}
			
			input:checked + .slider:before {
				-webkit-transform: translateX(13px);
				-ms-transform: translateX(13px);
				transform: translateX(13px);
			}
			
			/* Rounded sliders */
			.slider.round {
				border-radius: 17px;
			}
			
			.slider.round:before {
				border-radius: 50%;
			} 

			.checked {
				color: orange;
			}

			// .fa-star:hover{
			// 	color: orange;
			// }

			.inline{
				display: inline-block;
			}
			
			</style>


			</head>
		<body>
	` + body_content + `
		<script>

			const vscode = acquireVsCodeApi();

			$("button").click(function() {
				if($(this).hasClass( "btn-send-to-editor" )){
					vscode.postMessage({command: 'code',text: $(this).next().next().html()})
				}
				
				if($(this).hasClass( "btn-next-page" )){
					vscode.postMessage({command: 'next_page'})
				}

				if($(this).hasClass( "btn-previous-page" )){
					vscode.postMessage({command: 'previous_page'})
				}

				if($(this).hasClass( "btn-show-results" )){
					if($("#title_popup").css("display")=="none"){
						$("#title_popup").css("display", "block")
					}else{
						$("#title_popup").css("display", "none")
					}
				}else{
					$("#title_popup").css("display", "none")
				}

			});


			$(".question").click(function() {
				vscode.postMessage({command: 'change_page',id: $(this).attr("id")})
				$("#title_popup").css("display", "none")
			});

			$("#include_lang").change(function() {
				if(this.checked) {
					vscode.postMessage({command: 'include_lang_true'})
				}else{
					vscode.postMessage({command: 'include_lang_false'})
				}
			});			

			$(".share").click(function() {
				vscode.postMessage({command: 'share'})
			});			


			$("#delete_line").change(function() {
				if(this.checked) {
					vscode.postMessage({command: 'delete_line_true'})
				}else{
					vscode.postMessage({command: 'delete_line_false'})
				}
			});

			$(".rate").click(function() {
				vscode.postMessage({command: 'rate'})
			});		

		</script>
	</body>
	</html>`
}



async function get_google_results(search){
		global_google_question_ids = []

		try{
			let language_param = ""

			if(global_include_language){ 
				if(global_current_language!=""){
					language_param = global_current_language + " "
				}
			}

			let search_get = "site:stackoverflow.com " + language_param + search
			
			const params = {
				q: search_get
			};
			
	
			let url = 'https://www.google.com/search' + '?' + ( new URLSearchParams( params ) ).toString();
		
			const rawResponse = await fetch(url);
			const responseText = await rawResponse.text();
	
			var myString = responseText;
	
			const regexp = /stackoverflow.com\/questions\/(\d+)\//g;
			const matches = myString.matchAll(regexp);
	
			for (const match of matches) {
				global_google_question_ids.push(match[1])
			}
	
		}catch(err){

		}
		
}




function align_languages(){
		
	if(global_current_language == "plaintext"){
		global_current_language=""
	}

	if(global_current_language == "cpp"){
		global_current_language="c++"
	}

	if(global_current_language == "shellscript"){
		global_current_language="shell"
	}

	if(global_current_language == "cuda-cpp"){
		global_current_language="c++"
	}

	if(global_current_language == "csharp"){
		global_current_language="c#"
	}

	if(global_current_language == "fsharp"){
		global_current_language="f#"
	}

	if(global_current_language == "perl6"){
		global_current_language="perl"
	}

	if(global_current_language == "pip-requirements"){
		global_current_language="python"
	}

	if(global_current_language == "ignore"){
		global_current_language=""
	}

	if(global_current_language == "jsonc"){
		global_current_language="json"
	}

	if(global_current_language == "typescriptreact"){
		global_current_language="reactjs"
	}
	
	if(global_current_language == "javascriptreact"){
		global_current_language="reactjs"
	}


}
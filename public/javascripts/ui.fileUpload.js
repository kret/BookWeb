/***
 * @author m.orlowska
 * This jQuery plugin is created to provide functionality for drag 'n drop file upload.
 * To use it you have to create an DOM element in witch you can (but it is not obligatory) create
 * an fallback, pure HTML version of file upload.
 * <div id=file-upload>
 *		<div id=file-upload-fallback>
 *		// here fallback version goes
 *		</div>
 *	</div>
 * Then you just need to use the plugin magic:
 *	<script>
 *		jQuery('#file-upload').fileUpload({ fallback : 'file-upload-fallback'});
 *	</script>
 */
		//  http://onehub.com/blog/posts/designing-an-html5-drag-drop-file-uploader-using-sinatra-and-jquery-part-1/
		//  http://www.w3.org/Protocols/rfc2616/rfc2616-sec3.html
		//  http://en.wikipedia.org/wiki/MIME
		//! http://www.w3.org/Protocols/rfc1341/7_2_Multipart.html

(function( $ ){					
	view = {
		/** 
		 * All DOM elements
		 */
		DOM : {
			component	: null,
			fallback	: null,
			thumbnails	: null
		},
		
		init : function() {
			view.DOM.fallback	= jQuery('#' + this.data('fileUpload').fallback);
			view.DOM.component	= this;

			console.log('UI', 'fileUpload -- view initialization', 
				'componentDOM:', view.DOM.component, 
				'fallbackDOM:', view.DOM.fallback);
			
			// make _fallback less visible
			//
			
			// draw fancy file upload
			view.DOM.component.append(
				'<div id=drop-target>' +
					'<div class="help">Tu przeciągnij<br />pliki<br />z systemu</div>' +
				'</div>' +
				'<div id=thumbnails></div>' +
				'<a id=ok>Tak, te pliki chcę wysłać na serwer</a>'
			)
			
			// bind logic
			$('#drop-target').bind('dragenter',controller.stopDefaultBehavior)
				.bind('dragover', controller.stopDefaultBehavior)
				.bind('drop', controller.drop);
			jQuery('#ok').click(controller.send);
			
			
			return this;
		},
		showThumbnail : function( file, number ) {
			
				console.log('NYI', 'showThumbnail')
				var title = file.fileName;
				var img = jQuery('<div id='+ 'img_' + parseInt(Math.random()*999999999999)
					+ ' title=' + title + ' class="img"><h4>'+title+'</h4></div>'
				);
				$('#thumbnails').append(img);
				$(img).click(function(event) {controller.markAsBad(number); $(this).toggleClass('border')})
				var fr = new FileReader();
				//  fr.file = file;
				fr.onload = function(e) {
					//console.log(['FileReader onload', e]);
					img.css('background-image', "url('" + this.result + "')");
					//file.unid = showThumbnail(this.result, this.file.fileName);
				}
				fr.readAsDataURL(file);
		},
		clearThumbnails : function() {
			$('#thumbnails').html('')
		}
	};

	controller = {
		files : new Array(),
		max : null,

		markAsBad : function(number) {
			console.log(number)
			controller.files[number].doNotSend = !controller.files[number].doNotSend
		},
		
		/**
		 * Initialization of component
		 */
		init : function( _options ) {
				console.log('UI', 'fileUpload -- logic initialization')
				$(this).data('fileUpload', {
					fallback : _options['fallback']
				});
				controller.max = _options['max'] || 1;
				return view.init.apply( this );
			
		},
		
		/**
		 * Prevents browser from handling and propagating event
		 * @param _event	event for which handling and propagation should be stopped
		 */
		stopDefaultBehavior : function( _event ) {
				_event.stopPropagation();
				_event.preventDefault();
				return false;
		},

		send : function() {
			var _files = controller.files;
			controller.files = new Array();
			view.clearThumbnails();
			console.log(_files)
			if (_files.length > 0) {
			
					function generateBoundary( _length )
					{
						var text = "", 
							possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
					
						for( var i=0; i < _length; i++ )
							text += possible.charAt(Math.floor(Math.random() * possible.length));
					
						return text;
					};
					
					function addFile( _file ) {
						var _varName = 'datafile[]';
						return  boundary +'\r\nContent-Disposition: form-data; name="' + _varName + '"; filename="' + _file.name + '"\r\nContent-Type: ' + _file.type + '\r\n\r\n' + _file + '\r\n--' ;							
					};
					
					var boundary 	= generateBoundary(15);
						xhr 		= new XMLHttpRequest(),
						requestData = '';

					var prev = requestData;
					$.each(_files, function ( i, file ) {
						if(!file.doNotSend)
							requestData += addFile(file)
					});
					if(prev !== requestData) {
						xhr.open('POST', '/monoRail/upload');
						xhr.onreadystatechange = function(e) {
						
							//console.log('-- XHR onreadystatechange', e, this.readyState);
							if ( 4 == this.readyState ) {
								//console.log(['xhr upload complete', e]);
								var t = this.responseText;
								//console.log(['Upload complete', t]);
								//imageUploaded(this.file, t);
							}
						};    						
						xhr.setRequestHeader("Content-Type", "multipart/form-data; boundary="+boundary);
						xhr.send ('--' + requestData + boundary + '--');
					}
			};
		
		},

		drop : function(event) {
			controller.stopDefaultBehavior(event)

			var left = controller.max - controller.files.length,
				numberOfFilesToBeUploaded = ( event.originalEvent.dataTransfer.files.length < left) ? event.originalEvent.dataTransfer.files.length : left

			// because <FileList> Object is read only http://www.w3.org/TR/FileAPI/#dfn-filelist
			for (var i = 0, l = numberOfFilesToBeUploaded; i < l; i++) {
				controller.files.push(event.originalEvent.dataTransfer.files[i]);
				view.showThumbnail(event.originalEvent.dataTransfer.files[i], controller.files.length-1)
			}
			console.log('a', controller.files)
			
		}
	};

	$.fn.fileUpload = function( method ) {
		//if ( controller[method] ) {
		//	return controller[ method ].apply( this, Array.prototype.slice.call( arguments, 1 ));
		//} else 
		//if ( typeof method === 'object' || ! method ) {
			console.log('UI', 'fileUpload', this, arguments)
			return controller.init.apply( this, arguments );
		//} else {
		//	$.error( 'Method ' +  method + ' does not exist on jQuery.tooltip' );
		//}    
	};
})( jQuery );
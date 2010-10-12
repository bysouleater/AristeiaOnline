<html>
  <head>
	  <title>Grails Runtime Exception</title>
	  <style type="text/css">
	  		.message {
	  			border: 1px solid black;
	  			padding: 5px;
	  			background-color:#E9E9E9;
	  		}
	  		.stack {
	  			border: 1px solid black;
	  			padding: 5px;
	  			overflow:auto;
	  			height: 300px;
	  		}
	  		.snippet {
	  			padding: 5px;
	  			background-color:white;
	  			border:1px solid black;
	  			margin:3px;
	  			font-family:courier;
	  		}
	  </style>
  </head>

  <body>
    <h1>Aristeia Runtime Exception</h1>
    <h2>Error Details <a href="javascript:document.reportForm.submit();">Report Error</a></h2>

	<g:form method="post" name="reportForm" controller="aoError" action="report">
		<g:hiddenField name="error" value="${request.'javax.servlet.error.message'}"></g:hiddenField>
		<g:hiddenField name="servlet" value="${request.'javax.servlet.error.servlet_name'}"></g:hiddenField>
		<g:hiddenField name="uri" value="${request.'javax.servlet.error.request_uri'}"></g:hiddenField>
		<g:hiddenField name="exception_message" value="${exception?.message}"></g:hiddenField>
		<g:hiddenField name="caused_by" value="${exception?.cause?.message}"></g:hiddenField>
		<g:hiddenField name="exception_class" value="${exception?.className}"></g:hiddenField>
		<g:hiddenField name="at_line" value="${exception?.lineNumber}"></g:hiddenField>
		
		<g:each in="${exception?.stackTraceLines?}" var="l" status="i">
			<g:hiddenField name="stack_trace${i}" value="${l}"></g:hiddenField>
		</g:each>
		
		
	</g:form>

  	<div class="message">
		<strong>Error ${request.'javax.servlet.error.status_code'}:</strong> ${request.'javax.servlet.error.message'.encodeAsHTML()}<br/>
		<strong>Servlet:</strong> ${request.'javax.servlet.error.servlet_name'}<br/>
		<strong>URI:</strong> ${request.'javax.servlet.error.request_uri'}<br/>
		<g:if test="${exception}">
	  		<strong>Exception Message:</strong> ${exception.message?.encodeAsHTML()} <br />
	  		<strong>Caused by:</strong> ${exception.cause?.message?.encodeAsHTML()} <br />
	  		<strong>Class:</strong> ${exception.className} <br />
	  		<strong>At Line:</strong> [${exception.lineNumber}] <br />
	  		<strong>Code Snippet:</strong><br />
	  		<div class="snippet">
	  			<g:each var="cs" in="${exception.codeSnippet}">
	  				${cs?.encodeAsHTML()}<br />
	  			</g:each>
	  		</div>
		</g:if>
  	</div>
	<g:if test="${exception}">
	    <h2>Stack Trace</h2>
	    <div class="stack">
	      <pre><g:each in="${exception.stackTraceLines}">${it.encodeAsHTML()}<br/></g:each></pre>
	    </div>
	</g:if>
  </body>
</html>
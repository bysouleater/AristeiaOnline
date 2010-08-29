<html>
	<head>
		<meta name="layout" content="main"></meta>
	</head>
	<body>
		<div id="content">
			<h3><span>Create a new warrior</span></h3>
			<g:form method="get" controller="warrior" action="save">
				<table>
					<tr>
						<td class="labeltd">Name</td>
						<td><g:textField name="name" value=""/></td>
					</tr>
					<tr>
						<td class="labeltd">Origin city</td>
						<td>
							<g:select name="origin" from="${cities}" noSelection="${[0:'Select origin city']}" optionKey="id" optionValue="name"/>
						</td>
					</tr>			
					<tr>
						<td class="labeltd">Gender</td>
						<td>
							<input id="genderM" class="inputradio" type="radio" value="M" name="gender" checked="checked"/>
							<label id="label_genderM" for="genderM" class="labelradio">Male</label>
							<input id="genderF" class="inputradio" type="radio" value="F" name="gender"/>
							<label id="label_genderF" for="genderF" class="labelradio">Female</label>
						</td>
					</tr>			
				</table>
				<div class="clear"></div>
				<div class="formButtons">
					<button type="submit">Create Warrior</button>
					<g:link action="index" controller="main" style="text-decoration:none;"><button class="cancel">Cancel</button></g:link>
				</div>
			</g:form>
		</div>
	</body>
</html>

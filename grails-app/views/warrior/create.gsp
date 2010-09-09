<html>
	<head>
		<meta name="layout" content="main"></meta>
	</head>
	<body>
		<div id="content">
			<h3>Create a new warrior</h3>
			<g:form method="get" controller="warrior" action="save">
				<table style="margin-left:20px;">
					<tr>
						<td align="right" class="labeltxt">Name</td>
						<td><g:textField style="width:155px;" name="name" value=""/></td>
					</tr>
					<tr>
						<td align="right" class="labeltxt">Origin city</td>
						<td><g:select style="width:155px;" name="origin" from="${cities}" noSelection="${[0:'Select origin city']}" optionKey="id" optionValue="name"/></td>
					</tr>			
					<tr>
						<td align="right" class="labeltxt">Gender</td>
						<td class="labelvalue" valign="middle">
							<input id="genderM" type="radio" value="M" name="gender" checked="checked"/>
							<label id="label_genderM" for="genderM">Male</label>
							<input id="genderF" type="radio" value="F" name="gender"/>
							<label id="label_genderF" for="genderF">Female</label>
						</td>
					</tr>			
				</table>
				<div class="clear"></div>
				<div class="formButtons">
					<button class="buttonlindo" type="submit">Create Warrior</button>
					<g:link action="index" controller="main"><button class="buttonlindo cancel">Cancel</button></g:link>
				</div>
			</g:form>
		</div>
	</body>
</html>

<html>
	<head>
		<meta name="layout" content="main"></meta>
	</head>
	<body>
		<div id="content">
			<h3>Create a new warrior</h3>
			<g:form name="create" method="get" controller="warrior" action="save">
				<table width="100%">
					<tr>
						<td align="center">
							<table>
								<tr>
									<td>
										<table>
											<tr>
												<td style="padding-top:10px;" align="right" class="labeltxt">Name</td>
												<td style="padding-top:10px;"><g:textField style="width:155px;" name="name" value="${wrc?.name}"/></td>
											</tr>
											<g:hasErrors bean="${wrc}" field="name">
												<g:eachError bean="${wrc}" field="name">
													<tr>
														<td></td>
														<td width="200" class="labelvalue" style="color:red;padding-top:5px;"><g:message error="${it}"/></td>
													</tr>
												</g:eachError>
											</g:hasErrors>
											<tr>
												<td style="padding-top:10px;" align="right" class="labeltxt">Origin city</td>
												<td style="padding-top:10px;">
													<g:select onclick="javascript:refresh();" style="width:155px;" name="origin" 
														from="${cities}" noSelection="${[0:'Select origin city']}" optionKey="id" 
														optionValue="name" value="${wrc?.origin}"/>
												</td>
											</tr>
											<g:hasErrors bean="${wrc}" field="origin">
												<g:eachError bean="${wrc}" field="origin">
													<tr>
														<td></td>
														<td width="200" class="labelvalue" style="color:red;padding-top:5px;"><g:message error="${it}"/></td>
													</tr>
												</g:eachError>
											</g:hasErrors>			
											<tr>
												<td style="padding-top:10px;" align="right" class="labeltxt">Gender</td>
												<td style="padding-top:10px;" class="labelvalue" valign="middle">
													<input id="genderM" type="radio" value="M" name="gender" checked="checked" onclick="javascript:refresh();"/>
													<label id="label_genderM" for="genderM">Male</label>
													<input id="genderF" type="radio" value="F" name="gender" onclick="javascript:refresh();"/>
													<label id="label_genderF" for="genderF">Female</label>
												</td>
											</tr>
											<g:hasErrors bean="${wrc}" field="gender">
												<g:eachError bean="${wrc}" field="gender">
													<tr>
														<td width="200" colspan="2" class="labelvalue" style="color:red;padding-top:5px;"><g:message error="${it}"/></td>
													</tr>
												</g:eachError>
											</g:hasErrors>
											<tr>
												<td style="padding-top:10px;" align="right" class="labeltxt" valign="top">Initial Stats</td>
												<td style="padding-top:10px;" class="labelvalue" valign="top" align="center">
													<table width="100%">
														<tr>
															<td align="center" class="labeltxt" >STR</td>
															<td align="center" class="labeltxt" >CON</td>
															<td align="center" class="labeltxt" >DEX</td>
															<td align="center" class="labeltxt" >AGI</td>
														</tr>
														<tr>
															<td align="center" class="labelvalue"><input readonly="readonly" class="labelvalue inputstat" id="STR" name="STR" type="text" value="0"/></td>
															<td align="center" class="labelvalue"><input readonly="readonly" class="labelvalue inputstat" id="CON" name="CON" type="text" value="0"/></td>
															<td align="center" class="labelvalue"><input readonly="readonly" class="labelvalue inputstat" id="DEX" name="DEX" type="text" value="0"/></td>
															<td align="center" class="labelvalue"><input readonly="readonly" class="labelvalue inputstat" id="AGI" name="AGI" type="text" value="0"/></td>
														</tr>
													</table>
												</td>
											</tr>	
										</table>
									</td>
									<td width="200"></td>
								</tr>
							</table>	
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
		<script>
			function refresh(){
				switch(document.create.origin.selectedIndex){
					case 0:{
						document.create.STR.value = 0;
						document.create.AGI.value = 0;
						document.create.DEX.value = 0;
						document.create.CON.value = 0;
						break;
					}
					case 1:{//Cebrene
						document.create.STR.value = 8;
						document.create.AGI.value = 5;
						document.create.DEX.value = 5;
						document.create.CON.value = 5;
						break;
					}
					case 2:{//Chalcedon
						document.create.STR.value = 5;
						document.create.AGI.value = 5;
						document.create.DEX.value = 8;
						document.create.CON.value = 5;
						break;
					}
					case 3:{//Baris
						document.create.STR.value = 5;
						document.create.AGI.value = 5;
						document.create.DEX.value = 5;
						document.create.CON.value = 8;
						break;
					}
					case 4:{//Mallia
						document.create.STR.value = 5;
						document.create.AGI.value = 8;
						document.create.DEX.value = 5;
						document.create.CON.value = 5;
						break;
					}
				}
				if(document.getElementById('genderM').checked)
					document.create.STR.value = parseInt(document.create.STR.value) + 1;
				else
					document.create.AGI.value = parseInt(document.create.AGI.value) + 1;
			}
			refresh();
		</script>
	</body>
</html>

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
												<td style="padding-top:15px;" valign="top" align="right" class="labeltxt2"><i style="color:#777777;">Select your warrior</i> <b>Name</b><br><i style="color:#777777;">to identify it</i></td>
												<td style="padding-top:10px;" width="200" valign="top"><g:textField style="width:155px;margin-bottom:5px;margin-left:3px;" name="name" value="${wrc?.name}"/>
													<g:hasErrors bean="${wrc}" field="name">
														<g:eachError bean="${wrc}" field="name">
															<br><label class="labelvalue" style="color:red;"><g:message error="${it}"/></label>
														</g:eachError>
													</g:hasErrors>
												
												</td>
											</tr>
											<tr>
												<td style="padding-top:15px;" valign="top" align="right" class="labeltxt2"><i style="color:#777777;">Choose an</i> <b>Origin city</b><br><i style="color:#777777;">to determine your initial stats</i></td>
												<td style="padding-top:10px;" width="200" valign="top">
													<g:select onchange="javascript:refresh();" style="width:155px;margin-bottom:7px;margin-left:3px;" name="origin" 
														from="${cities}" noSelection="${[0:'Select origin city']}" optionKey="id" 
														optionValue="name" value="${wrc?.origin}"/>
													<g:hasErrors bean="${wrc}" field="origin">
														<g:eachError bean="${wrc}" field="origin">
															<br><label class="labelvalue" style="color:red;"><g:message error="${it}"/></label>
														</g:eachError>
													</g:hasErrors>
												</td>
											</tr>
											<tr>
												<td style="padding-top:17px;" valign="top" align="right" class="labeltxt2"><i style="color:#777777;">Determine its</i> <b>Gender</b></td>
												<td style="padding-top:10px;" class="labelvalue" valign="middle">
													<table>
														<tr>
															<td valign="middle"  class="labelvalue"><input id="genderM" type="radio" value="M" name="gender" checked="checked" onclick="javascript:refresh();"/></td>
															<td valign="middle" width="50" class="labelvalue" style="padding-top:5px;"><label id="label_genderM" for="genderM">Male</label></td>
															<td valign="middle" class="labelvalue"><input id="genderF" type="radio" value="F" name="gender" onclick="javascript:refresh();"/></td>
															<td valign="middle" width="50" class="labelvalue" style="padding-top:5px;"><label id="label_genderF" for="genderF">Female</label></td>
														</tr>
														<tr>
															<td align="center" colspan="2" class="labelvalue">(+1 STR)</td>
															<td align="center" colspan="2" class="labelvalue">(+1 AGI)</td>
														</tr>
														<tr></tr>
													</table>
													
													
													
													
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
												<td style="padding-top:10px;" align="right" class="labeltxt2" valign="top"><i style="color:#777777;">Your warrior</i> <b>Initial Stats</b></td>
												<td style="padding-top:10px;" class="labelvalue" valign="top" align="left">
													<table width="165">
														<tr>
															<td align="center" class="labeltxt2" >STR</td>
															<td align="center" class="labeltxt2" >CON</td>
															<td align="center" class="labeltxt2" >DEX</td>
															<td align="center" class="labeltxt2" >AGI</td>
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
									<td width="200" align="center" valign="middle">
										<label class="labeltxt2"><i style="color:#777777;">Your warrior</i> <b>Picture</b></label>
										<div id="malepic"><img src="/images/jobs/M/Newbie.png"/></div>
										<div id="femalepic" style="display:none;"><img src="/images/jobs/F/Newbie.png"/></div>
									
									</td>
								</tr>
							</table>	
						</td>
					</tr>	
				</table>
				<div class="clear"></div>
				<div class="formButtons">
					<button class="buttonlindo" type="submit">Create Warrior</button>
					<g:link action="warriorList" controller="main"><button class="buttonlindo cancel">Cancel</button></g:link>
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
				if(document.getElementById('genderM').checked){
					document.create.STR.value = parseInt(document.create.STR.value) + 1;
					$("#malepic").show()
					$("#femalepic").hide()
				}else{
					document.create.AGI.value = parseInt(document.create.AGI.value) + 1;
					$("#malepic").hide()
					$("#femalepic").show()
				}
			}
			refresh();
		</script>
	</body>
</html>

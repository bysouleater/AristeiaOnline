<html>
	<head>
		<meta name="layout" content="main"></meta>
		<style>
			body{
				font-family:"Arial";
				font-size:12px;
			}	
			.charinfo{
				float:left;
				width:250px;
			}
			.charfield{
				width:250px;
				float:left;
			}
			.charfield2{
				width:130px;
				float:left;
			}
			.charjournal{
				width:500px;
				float:left;
			}
			.title{
				font-size: 16px;
			}
		</style>
	</head>
	<body>
		<div id="content">
			<h3><span>${warrior.name} - Newbie Lvl 1</span></h3>
			<table width="100%">
				<tr>
					<td width="100">
						<img src="male_paladin.jpeg"/>
					</td>
					<td width="160">
						<div class="statusbartext">HP &nbsp;&nbsp;15 / 15</div>
						<div class="statusbar outside">
							<div class="statusbar inside" style="width:60px;background-color:#FF0000"></div></div>
						<div class="statusbartext">STA &nbsp;&nbsp;15 / 15</div>
						<div class="statusbar outside">
							<div class="statusbar inside" style="width:60px;background-color:#FFE303"></div></div>
						<div class="statusbartext" style="font-size:10px;">EXP &nbsp;&nbsp;1.375.135 / 1.378.000</div>
						<div class="statusbar outside">
							<div class="statusbar inside" style="width:60px;background-color:#0000FF"></div></div>


					</td>
					<td>
						<table width="100%" style="font-size:12px;">
							<tr>
								<td>STR</td><td>5</td><td>DEX</td><td>5</td><td>P.Attack</td><td>100</td><td>P.Def</td><td>30</td>
							</tr>
							<tr>
								<td>CON</td><td>5</td><td>AGI</td><td>5</td><td>Accuray</td><td>100</td><td>Evasion</td><td>30</td>
							</tr>
							<tr>
								<td></td><td></td><td></td><td></td><td>Attack Rate</td><td>100</td><td>Critic Rate</td><td>30</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table width="100%">
				<tr>
					<td width="150" valign="top">
						<h4>Actions</h4>
						<ul class="actionspro">
							<li><a href="#">Action</a></li>
							<li><a href="#">Action2</a></li>
							<li><a href="#">Action</a></li>
							<li><a href="#">Action2</a></li>
							<li><a href="#">Action</a></li>
							<li><a href="#">Action2</a></li>
							<li><a href="#">Action</a></li>
							<li><a href="#">Action2</a></li>
							<li><a href="#">Action</a></li>
							<li><a href="#">Action2</a></li>
							<li><a href="#">Action</a></li>
							<li><a href="#">Action2</a></li>
						</ul>
					</td>
					<td valign="top">
						<div id="content">
							<h4>Journal</h4>
							<ul style="font-size:12px;">
								<li>Lorem ipsum  ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an.</li>
								<li>Lorem ipsum  ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an.</li>
								<li>Lorem ipsum  ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an.</li>
								<li>Lorem ipsum  ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an.</li>
								<li>Lorem ipsum  ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an.</li>
								<li>Lorem ipsum  ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an.</li>
							</ul>
						</div>
					</td>
				</tr>
			</table>			
		</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		<div class="charinfo">
			<div class="title">${warrior.name}</div>
			<div class="charfield">${warrior.job} - Nivel ${warrior.level}</div>
			<div class="charfield">Exp: ${0}/${1000}</div>
			<img style="float:left" src="/images/male_paladin.png"/>
			<div class="charfield2">HP: ${warrior.actualHP}/${warrior.maxHP}</div>
			<div class="charfield2">STR ${10}</div>
		</div>
		<div class="charjournal">
			<div class="title">Diario</div>
			<p>Ayer fuiste a entrenar. Subiste 1 punto de STR</p>
			<p>Ayer fuiste a entrenar. Subiste 1 punto de STR</p>
			<p>Ayer fuiste a entrenar. Subiste 1 punto de STR</p>
		</div>
		<div style="clear:both"></div>
		<div style="float:right" style="margin-top:20px;"><g:link action="index" controller="main">Volver a la lista de guerreros</g:link></div>
	</body>
</html>

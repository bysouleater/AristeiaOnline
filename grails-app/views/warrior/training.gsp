<html>
	<head>
		<meta name="layout" content="game"></meta>
	</head>
	<body>
		<td valign="top">
			<div id="content">
				<h4>Training</h4>
				<div style="font-size:14px;">You are now in <b>${warrior.actualLocation.name}</b></div>
				<g:if test="${warrior.actualLocation.trainingPlaces != null && warrior.actualLocation.trainingPlaces.size() > 0}">
					<g:form name="trainForm" method="get" controller="warrior" action="train" style="margin:0px;">
					<input type="hidden" name="tp" value=""/>
					<input type="hidden" name="id" value="${warrior.id}"/>
					<g:each in="${warrior.actualLocation.trainingPlaces}" status="i" var="tp">
						<div style="margin:15px 0px 20px 20px;">
							<a style="width:400px;" class="buttonlink biglink" href="javascript:train(${tp.id});">
								<img height="30" width="130px;" style="float:left;margin-right:10px;" src="/images/grails_logo.png"/>
								<b>${tp.name}</b> (${tp.STArequired} STA)
								<br>
								<b>Skills: </b><g:each in="${tp.skills.all()}" status="x" var="s">
									<g:if test="${s.value > 0}">
										${s.key} <img width="15" height="12" src="/images/up.png"/>
									</g:if>
								</g:each> 
							</a>
						</div>
					</g:each>
					<script>
						function train(tp){
							document.trainForm.tp.value = tp;
							document.trainForm.submit();
						}
					</script>
					</g:form>
				</g:if>
				<g:else>
					<div style="padding-left:30px;font-size:12px;">There's nowhere to train here.</div>
				</g:else>
			</div>
		</td>
	</body>
</html>

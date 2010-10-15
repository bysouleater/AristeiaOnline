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
					<g:each in="${warrior.actualLocation.trainingPlaces}" status="i" var="tp">
						<div style="margin:15px 0px 20px 20px;">
							<g:if test="${warrior.actualSTA >= tp.STArequired}">
								<a style="width:400px;" class="buttonlink biglink" href="javascript:confirmTrain(${tp.id},'${tp.name}','/images/default_tp.png','${tp.skills.titleStats()}');">
									<img height="30" width="130" style="float:left;margin-right:10px;" src="/images/default_tp.png"/>
									<b>${tp.name}</b> (${tp.STArequired} STA)
									<br><b>Skills </b>${tp.skills.titleStats()}
								</a>
							</g:if>
							<g:else>
								<span style="width:400px;" class="buttonlink biglink disabled">
									<img height="30" width="130" style="float:left;margin-right:10px;" src="/images/default_tp.png"/>
									<b>${tp.name}</b> (${tp.STArequired} STA)
									<br><b>Skills </b>${tp.skills.titleStats()}
								</span>
							</g:else>
						</div>
					</g:each>
				</g:if>
				<g:else>
					<div style="padding-left:30px;font-size:12px;">There's nowhere to train here.</div>
				</g:else>
			</div>
			<jqui:resources theme="aristeia"/>
			<script>
				$(document).ready(function() {
				    $("#confirm_train").dialog({ autoOpen:false, resizable:false, position:[170,150], minWidth:400,
					    buttons: { "Ok": function() { document.trainForm.submit();},
				    			   "Cancel": function() { $(this).dialog("close");} }
				    });
				});
				
				function confirmTrain(tp_id, tp_name, tp_pic, tp_skills){
					$("#train_pic").attr("src",tp_pic);
					$("#training_place_id").attr("value",tp_id);
					$("#tp_name").html("<b>" + tp_name + "</b><br><b>Skills</b> " + tp_skills);
					$("#confirm_train").dialog({title : "Train in " + tp_name + "?"});
					$("#confirm_train").dialog("open");
				}
			</script>
			<g:form name="trainForm" method="get" controller="warrior" action="train">
				<g:hiddenField name="training_place_id"/>
				<div style="display:none;" id="confirm_train" title="Train">
					<div style="line-height: 1.5em;">
						<div id="train_imgdiv" title="" style="float:left;margin-top:5px;margin-right:10px;margin-bottom:10px;">
							<img height="30" width="130" id="train_pic" style="padding-left:2px;padding-top:2px;" src=""/>
						</div>
						<label id="tp_name"></label>
					</div>
				</div>
			</g:form>
		</td>
	</body>
</html>

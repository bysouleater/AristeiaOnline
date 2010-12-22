<g:applyLayout name="main">
<div id="content">
	<h3>Report a Bug</h3>
	<g:form controller="aoBug" action="report">
		<table width="600" style="margin-top:10px;margin-left:40px;">
		<tr>
			<td align="left" valign="top" style="font-size:12px;">Bug Description</td>
			<td align="right">
				<g:textArea style="width:490px;height:300px;" name="text"/>					
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right"><g:submitButton class="buttonlindo" name="reportBug" value="Report"></g:submitButton></td>
		</tr>
	</table>
	</g:form>
	<div style="text-align:right;margin-top:20px;">
		<g:link style="text-decoration:none;" action="warriorList" controller="main"><b>Back to warriors list</b></g:link>
	</div>	
</div>
</g:applyLayout>
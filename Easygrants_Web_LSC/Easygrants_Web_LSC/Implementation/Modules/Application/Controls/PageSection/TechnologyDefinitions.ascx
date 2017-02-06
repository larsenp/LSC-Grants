<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
  
<style>
	li {padding-bottom:6px;}
</style>

<div style="width:600">
	<br />
	<h1>Technology Definitions </h1>
	<ol>
		<li><strong>A2J Author: </strong>This is a user friendly interface for automated forms interviews which incorporates website standards for low-literacy users, including graphics, to create an easy to navigate interview for automated forms. The guided interviews created with A2J Author remove many of the barriers faced by self-represented litigants, allowing them to easily complete court documents that are ready to be filed with the court system. A2J Author is available for free to interested courts, legal service organizations, and members of the HotDocs development community for non-commercial use.&nbsp; </li>
	
		<li><strong>Cloud Computing:  </strong>An approach to computing where users access services and run applications over the Internet. Cloud services are hosted off site, often by large companies such as Google and Amazon. Cloud computing also includes web-based applications such as Google Apps, Basecamp, and hosted SharePoint.</li>
	
		<li><strong>Computer Network: </strong>A shared structure of computer hardware and software that serves users within a confined geographical area. It is made up of servers, workstations, a network operating system and a communications link. Servers are high-speed machines that hold programs and data shared by network users. The workstations are the users' personal computers, which perform stand-alone processing and access the network servers as required.</li>
	
		<li><strong>HotDocs: </strong>This is a commercial document assembly product from HotDocs Limited (previously Capsoft) used to create online forms and pleadings. Once a form has been created and uploaded to the website, pro se users and program advocates can fill in the form by answering questions and entering the information requested. The software then combines the information and supplies a finished form that can be saved and printed.</li>
	
		<li><strong>LawHelp Interactive: </strong> This is a project of Pro Bono Net, a nonprofit committed to increasing access to justice with technology, in cooperation with Ohio State Legal Services Association. The project provides a national server for legal aid programs to post HotDocs to create legal forms and documents. Users are asked a series of questions, and their answers are used to tailor their documents.  </li>
	
		<li><strong>Virtualization: </strong> A process designed to reduce server management costs by running multiple operating systems independently on the same server. Microsoft, Citrix, and VMWare all offer commonly used virtualization solutions.</li>
	
		<li><strong>VPN: </strong> A virtual private network (VPN) is a network that uses a public telecommunication infrastructure, such as the Internet, to provide remote offices or individual users with secure access to their organization's network.</li>
	</ol>
	<div style="text-align:center" runat='server' id='spnClose' />
     
</div>

  <!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
  <ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Type='cButton'
						Container='spnClose'
						Image='Close'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Software' />
							</Parameters>	
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
  </ModuleSection>
</span>
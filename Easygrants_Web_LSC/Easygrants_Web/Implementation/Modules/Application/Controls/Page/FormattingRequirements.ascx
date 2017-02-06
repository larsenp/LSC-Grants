<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br>
Observe the following formatting requirements for each uploaded document:
<br>
All files must be in one of the following two formats:
<ul>
    <li>Microsoft Word for Windows, with a filename extension of .doc</li>
    <li>Rich Text Format (available from File->Save As menu item in most word processors) with a filename extension  of .rtf  (Macintosh, Linux, and other platforms' word processors will support saving the file in RTF format.)</li>
</ul>
For Word (.doc) or Rich Text Format (.rtf) documents
<ul>
    <li>Ensure that your file does not exceed specified size limitations expressed under the upload in terms of characters, words or pages.</li>
    <li>Ensure that uploaded files do not have password security.  If you upload a file without removing passward, you may be able to view it,       
but the uploaded file will be missing from the full Application PDF.</li>
    <li>All submissions must be prepared separately using a word processing program in a standard typeface font, minimum 1" margins all around, 8/5/11" paper format, and a file size no larger than 5MB.</li>
    <li>Graphics, charts and pictures must be part of the respective files to upload.</li>  
    <li>Do not include your full name at the top of each page.  This will be done by the proposal generation system.</li>
    <li>Do not number the pages in the body of the document.  This will be done by the proposal generation system.</li>
    <li>Do not include headers or footers in your document.</li>
</ul>
After you upload each file, click the View button in order to ensure that the file has been successfully uploaded and validated.  If the file has uploaded and validated properly, it will be displayed in PDF format.  If there were any problems, the error message(s) will display.  

<br>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

	</ModuleSection>
</span>
<!-- End Embedded XML -->

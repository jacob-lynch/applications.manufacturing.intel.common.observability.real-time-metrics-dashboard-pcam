<%@ Page Language="C#" AutoEventWireup="true" CodeFile="../Dashboard.aspx.cs" Inherits="_Default" %>
   <%@ Import Namespace="System.IO" %>  
<%@ Register Assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.DynamicData" TagPrefix="cc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Pragma" content="no-cache">
    <title>Dashboard</title>
</head>
<link href="../PCAM/PCAMStyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.quicksearch.js" type="text/javascript"></script>
    <script type="text/javascript" src="/Dashboard/Scripts/Table.js"></script>
    <script type="text/javascript">
<body topmargin="5" runat="server" id="Body1">
    <form id="form1" runat="server" style="margin: 0; padding: 0; display: inline;">
    <font style="font-size: 20">
	<%Response.Write("<table width='100%'><tr><td align=left>");%>
        <asp:Label ID="lblTitle" runat="server" Visible="true" CssClass="Header1" />
	<%Response.Write("</td><td align=right>");%>
       <% 
         FileInfo f1 = new FileInfo(Server.MapPath("Output/2_NTSC_Capability_Summary_Analysis.htm"));
         Response.Write("<font face=Tahoma size=4>Updated: " + f1.LastWriteTime.ToString() + "</font>");
        %>
	<%Response.Write("</td></tr></table>");%>
</font>
        <hr style="height: 1px; border-width: 0; color: gray; background-color: gray" />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Timer ID="Timer1" runat="server" Interval="60000" OnTick="Timer1_Tick" Enabled="false">
    </asp:Timer>
    <asp:UpdatePanel ID="UpdatePanelDebug" runat="server"  RenderMode="Inline">
        <ContentTemplate>
            <asp:Label ID="Label1" CssClass="LabelError" runat="server" Visible="true" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanelMaster" runat="server">
        <ContentTemplate>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanelMaster">
                <ProgressTemplate>
                    Loading..............
                    <asp:Image AlternateText="Loading..." ID="Splash" Visible="true" runat="server" ImageUrl="~/images/ajax-loader1.gif" />
                </ProgressTemplate>
            </asp:UpdateProgress>
            <asp:Label ID="lblTitle1" runat="server" Visible="true" />
            <div visible="false" style="display: none;">
                <asp:Button ID="btnPageLoad" runat="server" Text="Button" OnClick="btnPageLoad_Click" /></div>

<table border="0" cellpadding="0" cellspacing="0">
 <tr>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                        </Triggers>
                        <ContentTemplate>
                            <td valign="top"><br>
                                <a href="GridOnly_Dashboard.aspx?Page=IR2_Details_IR"><asp:Image ID="Image1" Visible="false" runat="server" /></a><br>
                                <asp:Label ID="lblImage1Info" runat="server" />
                                <a href="GridOnly_Dashboard.aspx?Page=IR2_Details_EGL"><asp:Image ID="Image3" Visible="false" runat="server" /></a><br>
                                <asp:Label ID="lblImage3Info" runat="server" />
 
                            </td>
                            <td valign="top"><br>
                                <a href="GridOnly_Dashboard.aspx?Page=IR2_Details_IR"><asp:Image ID="Image2" Visible="false" runat="server" /></a><br>
                                <asp:Label ID="lblImage2Info" runat="server" />
                                <a href="GridOnly_Dashboard.aspx?Page=IR2_Details_EGL"><asp:Image ID="Image4" Visible="false" runat="server" /></a><br>
                                <asp:Label ID="lblImage4Info" runat="server" />                                                                                           
                            </td>
			</ContentTemplate>
		     </asp:UpdatePanel>
		</table>
 
        </ContentTemplate>
	</asp:UpdatePanel>
	</form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="../Dashboard.aspx.cs" Inherits="_Default"
    Debug="true" %>
   <%@ Import Namespace="System.IO" %> 
<%@ Register Assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.DynamicData" TagPrefix="cc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Dashboard</title>
<link href="../PCAM/PCAMStyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.quicksearch.js" type="text/javascript"></script>
    <script type="text/javascript" src="/Dashboard/Scripts/Table.js"></script>
    <script type="text/javascript">
</head>
<body topmargin="5" runat="server" id="Body1">
    <form id="form1" runat="server" style="margin: 0; padding: 0; display: inline;">
    <font style="font-size: 20">
	<%Response.Write("<table width='100%'><tr><td align=left>");%>
        <asp:Label ID="lblTitle" runat="server" Visible="true" CssClass="Header1" />
	<%Response.Write("</td><td align=right>");%>
       <% 
         FileInfo f1 = new FileInfo(Server.MapPath("Output/2_NTSC_Summary_and_Timeline_Analysis.htm"));
         Response.Write("<font face=Tahoma size=4>Updated: " + f1.LastWriteTime.ToString() + "</font>");
        %>
	<%Response.Write("</td></tr></table>");%>
</font>
        <hr style="height: 1px; border-width: 0; color: gray; background-color: gray" />
        
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Timer ID="Timer1" runat="server" Interval="25000" OnTick="Timer1_Tick" Enabled="false">
    </asp:Timer>
    <asp:Timer ID="Timer2" runat="server" Interval="60000" OnTick="Timer2_Tick" Enabled="false">
    </asp:Timer>
    <asp:UpdatePanel ID="UpdatePanelDebug" runat="server" RenderMode="Inline">
        <ContentTemplate>
            <asp:Label ID="lblDebug" CssClass="LabelError" runat="server" Visible="true" />
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
            <div visible="false" style="display: none;">
                <asp:Button ID="btnPageLoad" runat="server" Text="Button" OnClick="btnPageLoad_Click" />
            </div>

            <table border="0" cellpadding="2" cellspacing="2">
                <tr>
                    <td valign="top">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="Timer2" EventName="Tick" />
                            </Triggers>
                            <ContentTemplate>
                                <a href="MCArea.aspx?Page=MCDefMet"><asp:Image ID="Image1" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage1Info" CssClass="LabelInfo" runat="server" /></a><br>
                                <a href="MCArea.aspx?Page=MCDiff"><asp:Image ID="Image2" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage2Info" CssClass="LabelInfo" runat="server" /></a><br>
                                <a href="MCArea.aspx?Page=MCEtch"><asp:Image ID="Image3" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage3Info" CssClass="LabelInfo" runat="server" /></a><br>
                                <a href="MCArea.aspx?Page=MCEquipMetro"><asp:Image ID="Image4" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage4Info" CssClass="LabelInfo" runat="server" /></a><br>
                                <a href="MCArea.aspx?Page=MCFSG"><asp:Image ID="Image5" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage5Info" CssClass="LabelInfo" runat="server" /></a><br>
                                <a href="MCArea.aspx?Page=MCImplant"><asp:Image ID="Image6" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage6Info" CssClass="LabelInfo" runat="server" /></a><br>
                                <a href="MCArea.aspx?Page=MCLitho"><asp:Image ID="Image7" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage7Info" CssClass="LabelInfo" runat="server" /></a><br>
                                <a href="MCArea.aspx?Page=MCPL"><asp:Image ID="Image8" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage8Info" CssClass="LabelInfo" runat="server" /></a><br>
                                <a href="MCArea.aspx?Page=MCTF"><asp:Image ID="Image9" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage9Info" CssClass="LabelInfo" runat="server" /></a><br>
                                <a href="MCArea.aspx?Page=MCC4"><asp:Image ID="Image10" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage10Info" CssClass="LabelInfo" runat="server" /></a><br>
                                <a href="MCArea.aspx?Page=MCSort"><asp:Image ID="Image11" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage11Info" CssClass="LabelInfo" runat="server" /></a><br>
                                <a href="MCArea.aspx?Page=MCTSV"><asp:Image ID="Image12" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage12Info" CssClass="LabelInfo" runat="server" /></a><br>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>

        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>

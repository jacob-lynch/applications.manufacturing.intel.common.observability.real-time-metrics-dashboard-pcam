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
         FileInfo f1 = new FileInfo(Server.MapPath("Output/MES State Model by Entity_XEUS.htm"));
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
                    <td colspan="2">
<!--                        <hr style="height: 1px; border-width: 0; color: gray; background-color: gray" /> -->
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                            </Triggers>
                            <ContentTemplate>
                                <asp:Label ID="Text1" CssClass="LabelValue" runat="server" Visible="false" />
                                &nbsp;
                                <asp:Label ID="Text2" CssClass="LabelValue" runat="server" Visible="false" />
                                &nbsp;
                                <asp:Label ID="Text3" CssClass="LabelValue" runat="server" Visible="false" />
                                &nbsp;
                                <asp:Label ID="Text4" CssClass="LabelValue" runat="server" Visible="false" />
                                &nbsp;
                                <asp:Label ID="Text5" CssClass="LabelValue" runat="server" Visible="false" />
                                &nbsp;
                                <asp:Label ID="Text6" CssClass="LabelValue" runat="server" Visible="false" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
<!--                        <hr style="height: 1px; border-width: 0; color: gray; background-color: gray" /> -->
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="Timer2" EventName="Tick" />
                            </Triggers>
                            <ContentTemplate>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityANXEUS"><asp:Image ID="Image1" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage1Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityDIXEUS"><asp:Image ID="Image2" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage2Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityDISUBXEUS"><asp:Image ID="Image3" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage3Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityETXEUS"><asp:Image ID="Image4" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage4Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityETSUBXEUS"><asp:Image ID="Image5" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage5Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityFSGXEUS"><asp:Image ID="Image6" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage6Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityFSGSUBXEUS"><asp:Image ID="Image7" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage7Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityIMXEUS"><asp:Image ID="Image8" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage8Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityIMSUBXEUS"><asp:Image ID="Image9" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage9Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityLIXEUS"><asp:Image ID="Image10" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage10Info" CssClass="LabelInfo" runat="server" /><br>
                            	  <a href="GridOnly_Dashboard.aspx?Page=MESEntityLISUBXEUS"><asp:Image ID="Image11" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage11Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityDMXEUS"><asp:Image ID="Image12" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage12Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityPLXEUS"><asp:Image ID="Image13" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage13Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityPLSUBXEUS"><asp:Image ID="Image14" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage14Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityTFXEUS"><asp:Image ID="Image15" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage15Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityTFSUBXEUS"><asp:Image ID="Image16" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage16Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityWEXEUS"><asp:Image ID="Image17" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage17Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityWESUBXEUS"><asp:Image ID="Image18" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage18Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityDPXEUS"><asp:Image ID="Image19" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage19Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityDSXEUS"><asp:Image ID="Image20" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage20Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityDSSUBXEUS"><asp:Image ID="Image21" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage21Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityFBEXEUS"><asp:Image ID="Image22" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage22Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityFBESUBXEUS"><asp:Image ID="Image23" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage23Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntitySTXEUS"><asp:Image ID="Image24" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage24Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntitySTSUBXEUS"><asp:Image ID="Image25" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage25Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityTSVXEUS"><asp:Image ID="Image26" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage26Info" CssClass="LabelInfo" runat="server" /><br>
                                <a href="GridOnly_Dashboard.aspx?Page=MESEntityTSVSUBXEUS"><asp:Image ID="Image27" Visible="false" runat="server" /><br>
                                <asp:Label ID="lblImage27Info" CssClass="LabelInfo" runat="server" /><br>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                            </Triggers>
                            <ContentTemplate>
                                <asp:Label ID="lblGridView1Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView1" CssClass="GridView" runat="server" Width="100%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView1Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>
                                <asp:Label ID="lblGridView2Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView2" CssClass="GridView" runat="server" Width="100%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView2Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>
                                <asp:Label ID="lblGridView3Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView3" CssClass="GridView" runat="server" Width="100%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView3Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>
                                <asp:Label ID="lblGridView4Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView4" CssClass="GridView" runat="server" Width="100%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView4Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>
                                <asp:Label ID="lblGridView5Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView5" CssClass="GridView" runat="server" Width="100%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView5Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>
                                <asp:Label ID="lblGridView6Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView6" CssClass="GridView" runat="server" Width="100%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView6Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>
                                <asp:Label ID="lblGridView7Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView7" CssClass="GridView" runat="server" Width="100%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView7Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>
                                <asp:Label ID="lblGridView8Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView8" CssClass="GridView" runat="server" Width="100%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView8Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
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

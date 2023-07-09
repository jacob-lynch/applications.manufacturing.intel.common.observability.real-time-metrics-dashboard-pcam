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
         FileInfo f1 = new FileInfo(Server.MapPath("Output/Barnum_Metrics.htm"));
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
                    <td colspan="3">
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
                            <td valign="top"><br>
                                <a href="GridOnly_Dashboard.aspx?Page=BarnumCurrentQueueDetails"><asp:Image ID="Image1" Visible="false" runat="server" /></a><br>
                                <asp:Label ID="lblImage1Info" runat="server" />
                                <a href="GridOnly_Dashboard.aspx?Page=BarnumCurrentQueueDetails"><asp:Image ID="Image3" Visible="false" runat="server" /></a><br>
                                <asp:Label ID="lblImage3Info" runat="server" />
                                <a href="GridOnly_Dashboard.aspx?Page=BarnumCurrentQueueDetails"><asp:Image ID="Image5" Visible="false" runat="server" /></a><br>
                                <asp:Label ID="lblImage5Info" runat="server" />
                                <asp:Image ID="Image7" Visible="false" runat="server" /></a><br>
                                <asp:Label ID="lblImage7Info" runat="server" />                              
                                <asp:Image ID="Image9" Visible="false" runat="server" /></a><br>
                                <asp:Label ID="lblImage9Info" runat="server" />
                            </td>
                            <td valign="top"><br>
                                <a href="GridOnly_Dashboard.aspx?Page=BarnumCurrentQueueDetails"><asp:Image ID="Image2" Visible="false" runat="server" /></a><br>
                                <asp:Label ID="lblImage2Info" runat="server" />
                                <a href="GridOnly_Dashboard.aspx?Page=BarnumCurrentQueueDetails"><asp:Image ID="Image4" Visible="false" runat="server" /></a><br>
                                <asp:Label ID="lblImage4Info" runat="server" />
                                <a href="GridOnly_Dashboard.aspx?Page=BarnumCurrentQueueDetails"><asp:Image ID="Image6" Visible="false" runat="server" /></a><br>
                                <asp:Label ID="lblImage6Info" runat="server" />        
                                <asp:Image ID="Image8" Visible="false" runat="server" /></a><br>
                                <asp:Label ID="lblImage8Info" runat="server" />                                                     
                                <asp:Image ID="Image10" Visible="false" runat="server" /></a><br>
                                <asp:Label ID="lblImage10Info" runat="server" /> 
                            </td>
                            </tr>
                            <tr>
                            <td colspan=2">
                                <asp:Image ID="Image11" Visible="false" runat="server" /></a><br>
                                <asp:Label ID="lblImage11Info" runat="server" />
                            </td>
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

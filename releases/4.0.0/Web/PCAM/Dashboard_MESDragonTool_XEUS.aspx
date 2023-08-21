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
        $(function () {
            $('input#GridView1_search').quicksearch('table#GridView1 tbody tr');
            $('input#GridView2_search').quicksearch('table#GridView2 tbody tr');
        })
    </script>
</head>
<body topmargin="5" runat="server" id="Body1">
    <form id="form1" runat="server" style="margin: 0; padding: 0; display: inline;">
    <font style="font-size: 20">
	<%Response.Write("<table width='100%'><tr><td align=left>");%>
        <asp:Label ID="lblTitle" runat="server" Visible="true" CssClass="Header1" />
	<%Response.Write("</td><td align=right>");%>
       <% 
         FileInfo f1 = new FileInfo(Server.MapPath("Output/MES_DragonTool_XEUS.htm"));
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
                            </ContentTemplate>
                        </asp:UpdatePanel>
<!--                        <hr style="height: 1px; border-width: 0; color: gray; background-color: gray" /> -->
                    </td>
                </tr>
                
		<table border=0 width=100% cellpadding=0 cellspacing=0>
		  <tr>
		    <td>
                	<span id="lblGridView1Header" class="GridHeader"><b></b></span>
			<a id="HyperLinkGridView1Export"></a>&nbsp;
			<input id="GridView1_search" type="text" placeholder="Search" STYLE="font-size: 10px;" maxlength=50>
		    </td>
		  </tr>
		</table>
                
                <tr>
                    <td valign="top">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                            </Triggers>
                            <ContentTemplate>
                                <asp:Label ID="lblGridView1Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView1" CssClass="GridView" runat="server" Width="25%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView1Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                 </p>
                                                  </td>
                                
		<table border=0 width=100% cellpadding=0 cellspacing=0>
		  <tr>
		    <td>
                	<span id="lblGridView2Header" class="GridHeader"><b></b></span>
			<a id="HyperLinkGridView2Export"></a>&nbsp;
			<input id="GridView2_search" type="text" placeholder="Search" STYLE="font-size: 10px;" maxlength=50>
		    </td>
		  </tr>
		</table>                                
                    <td valign="top">
                                <asp:Label ID="lblGridView2Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView2" CssClass="GridView" runat="server" Width="25%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView2Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
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

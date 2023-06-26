<%@ Page Language="C#" AutoEventWireup="true" CodeFile="../Dashboard.aspx.cs" Inherits="_Default"
    Debug="true" %>
   <%@ Import Namespace="System.IO" %> 
<%@ Register Assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.DynamicData" TagPrefix="cc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Dashboard</title>
    <link href="PCAMStyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.quicksearch.js" type="text/javascript"></script>
    <script src="../Scripts/Table.js" type="text/javascript"></script>
    <script src="../Scripts/sorttable.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('input#GridView1_search').quicksearch('table#GridView1 tbody tr');
            $('input#GridView1_search').quicksearch('table#GridView2 tbody tr');
            $('input#GridView1_search').quicksearch('table#GridView3 tbody tr');
            $('input#GridView1_search').quicksearch('table#GridView4 tbody tr');
            $('input#GridView1_search').quicksearch('table#GridView5 tbody tr');
            $('input#GridView1_search').quicksearch('table#GridView6 tbody tr');
            $('input#GridView1_search').quicksearch('table#GridView7 tbody tr');
            $('input#GridView1_search').quicksearch('table#GridView8 tbody tr');
            $('input#GridView1_search').quicksearch('table#GridView9 tbody tr');
            $('input#GridView1_search').quicksearch('table#GridView10 tbody tr');
            $('input#GridView1_search').quicksearch('table#GridView11 tbody tr');
            $('input#GridView1_search').quicksearch('table#GridView12 tbody tr');
            $('input#GridView1_search').quicksearch('table#GridView13 tbody tr');
            $('input#GridView1_search').quicksearch('table#GridView14 tbody tr');
            $('input#GridView1_search').quicksearch('table#GridView15 tbody tr');
            $('input#GridView1_search').quicksearch('table#GridView16 tbody tr');
            $('input#GridView1_search').quicksearch('table#GridView17 tbody tr');

	    var gridCnt = 0;

	    $('.GridView').each(function() {
		gridCnt++;
		var s = "<input type='button' id='btn" + gridCnt + "' name='button' class='btn' value='Clear Monitor' />";
		$(this).before(s);
	    });

	  $('.btn').click(function() {
        var b = $(this);
        var grid = $('#' + b.attr('id') + ' + table').attr('id');
        var sBtn = b.attr('id').substr(b.attr('id').length-1,1);

        $.ajax({
          type: "POST",
          url: "/ClearMonitor/ClearMonitor.asp",
          data: { q: grid },
          success: function() {
            $('#' + b.attr('id') + ' + table').toggle();
            b.hide();
          },
          error: function() {
              alert("Error occurred in clearing alarm");
          }
        });
		});

        })
    </script>
    <script type="text/javascript">
		
    </script>
</head>
<body topmargin="5" runat="server" id="Body1">
    <form id="form1" runat="server" style="margin: 0; padding: 0; display: inline;">
    <font style="font-size: 20">
	<%Response.Write("<table width='100%'><tr><td align=left>");%>
        <asp:Label ID="lblTitle" runat="server" Visible="true" CssClass="Header1" />
	<%Response.Write("</td><td align=right>");%>
       <% 
         FileInfo f1 = new FileInfo(Server.MapPath("Output/DTWPullTransactions.htm"));
         Response.Write("<font face=Tahoma size=4>Updated: " + f1.LastWriteTime.ToString() + "</font>");
        %>
	<%Response.Write("</td></tr></table>");%>
</font>
        <hr style="height: 1px; border-width: 0; color: gray; background-color: gray" />
        
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Timer ID="Timer1" runat="server" Interval="60000" OnTick="Timer1_Tick" Enabled="false">
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
            <table border="0" cellpadding="2" cellspacing="2" >

		  <tr>
		    <td>
                	<span id="lblGridView1Header" class="GridHeader"><b>Search:</b></span>
			<a id="HyperLinkGridView1Export"></a>&nbsp;
			<input id="GridView1_search" type="text" placeholder="Search" STYLE="font-size: 10px;" maxlength=50>
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
                                <asp:GridView ID="GridView1" CssClass="GridView" runat="server" Width="500" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView1Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>
                                <asp:Label ID="lblGridView2Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView2" CssClass="GridView" runat="server" Width="500"  GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView2Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>
                                <asp:Label ID="lblGridView3Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView3" CssClass="GridView" runat="server" Width="500"  GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView3Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>

				<br><table width='1400'><tr><td align=left><font face=Tahoma size=4>DTW Failed Transactions</font></td><td align=right>
       				<% 
	 				FileInfo f2 = new FileInfo(Server.MapPath("Output/DTWFailureTransactions.htm"));
         				Response.Write("<font align=right face=Tahoma size=4>Updated: " + f2.LastWriteTime.ToString() + "</font>");
        			%>
				</td></tr></table>
				<hr style="height: 1px; border-width: 0; color: gray; background-color: gray" />

                                <asp:Label ID="lblGridView4Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView4" CssClass="GridView" runat="server" Width="10%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView4Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>
                                <asp:Label ID="lblGridView5Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView5" CssClass="GridView" runat="server" Width="10%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView5Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>
                                <asp:Label ID="lblGridView6Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView6" CssClass="GridView" runat="server" Width="10%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView6Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>
                                <asp:Label ID="lblGridView7Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView7" CssClass="GridView" runat="server" Width="10%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView7Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>
                                <asp:Label ID="lblGridView8Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView8" CssClass="GridView" runat="server" Width="10%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView8Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>
                                <asp:Label ID="lblGridView9Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView9" CssClass="GridView" runat="server" Width="10%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView9Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>
                                <asp:Label ID="lblGridView10Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView10" CssClass="GridView" runat="server" Width="10%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView10Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>
                                <asp:Label ID="lblGridView11Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView11" CssClass="GridView" runat="server" Width="10%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView11Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>
                                <asp:Label ID="lblGridView12Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView12" CssClass="GridView" runat="server" Width="10%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView12Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>
                                <asp:Label ID="lblGridView13Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView13" CssClass="GridView" runat="server" Width="10%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView13Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>
                                <asp:Label ID="lblGridView14Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView14" CssClass="GridView" runat="server" Width="10%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView14Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>
                                <asp:Label ID="lblGridView15Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView15" CssClass="GridView" runat="server" Width="10%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView15Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>
                                <asp:Label ID="lblGridView16Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView16" CssClass="GridView" runat="server" Width="10%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView16Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
                                <p>
                                </p>
                                <asp:Label ID="lblGridView17Header" CssClass="GridHeader" runat="server" Text="" Visible="false" />
                                <asp:GridView ID="GridView17" CssClass="GridView" runat="server" Width="10%" GridLines="Vertical"
                                    RowStyle-CssClass="row" FooterStyle-CssClass="footer" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="hdr" AlternatingRowStyle-CssClass="altrow">
                                </asp:GridView>
                                <asp:Label ID="lblGridView17Info" CssClass="LabelInfo" runat="server" Text=""></asp:Label>
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

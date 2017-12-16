<%@ Page Title="" Language="C#" MasterPageFile="~/View/layout/site1.master" AutoEventWireup="true" CodeFile="OrderDetail.aspx.cs" Inherits="View_Order_Order" %>

<%@ Register TagPrefix="uc1" TagName="TopFood" Src="~/View/Product/TopFood.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="bg-faded p-4 my-4">
        <hr class="divider" />
        <h2 class="text-center text-lg text-uppercase my-0">Giỏ hàng <a href="/"><span class="badge badge-danger">Quay Lại</span></a>
                </h2>
        <hr class="divider" />
        <div class="row">
            <form id="form1" runat="server" style="width: 100%">
                <h3 style="text-align: center; color: red;">
                        <asp:Label runat="server" ID="lblStatus" CssClass="status" /></h3>
                <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID" EnableModelValidation="True" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="Mã">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Tên Món">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Số Lượng">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:TextBox>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Price" HeaderText="Giá Tiền">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TotalPrice" HeaderText="Tổng tiền">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Chức Năng">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="select">Cập nhật</asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CommandName="delete" OnClientClick="return confirm('Bạn có muốn xóa?');">Xóa</asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:Button ID="btnOrder" runat="server" CssClass="btn btn-info" Text="Đặt hàng" OnClick="btnOrder_OnClick"/>
            </form>
        </div>
    </div>
    <uc1:TopFood runat="server" ID="TopFood" />

</asp:Content>


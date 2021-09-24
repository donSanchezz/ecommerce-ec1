<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="ECarRental.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
    });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:carrentalConnectionString %>" SelectCommand="SELECT * FROM [cars]"></asp:SqlDataSource>
           <div class="col">
               <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                   <Columns>
                       <asp:BoundField  DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" />
                       
                       
                       <%--<asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                       <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                       <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                       <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                       <asp:BoundField DataField="image" HeaderText="image" SortExpression="image" />--%>
                       <asp:TemplateField>
                           <ItemTemplate>
                           <div class="container-fluid">
                               <div class="row">
                                   <div class="col-lg-6">

                                       <div class="row">
                                           <div class="col-12">
                                               <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>' Font-Bold="True" Font-Size="Large"></asp:Label>
                                                
                                          </div>
                                       </div>

                                       <div class="row">
                                           <div class="col-12">
                                               
                                               Category -
                                               <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("category") %>'></asp:Label>
                                               &nbsp;| Price -
                                               <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("price") %>'></asp:Label>
                                               
                                          </div>
                                       </div>


                                       <div class="row">
                                           <div class="col-12">
                                               
                                               Description&nbsp; -
                                               <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("description") %>'></asp:Label>
                                               
                                          </div>
                                       </div>

                                       <div class="row">
                                           <div class="col-12">
                                               
                                               <asp:Button class="btn btn-primary mt-2" runat="server" ID="Button1" Text="Add to Cart" OnClick="Button1_Click" />
                                               
                                          </div>
                                       </div>







                                   </div>

                                  
                                   
                                   
                                   <div class="col-lg-6">
                                       <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("image") %>' />
                                   </div>

                               </div>

                           </div>
                               </ItemTemplate>

                       </asp:TemplateField>
                   </Columns>
               </asp:GridView>
           </div>
        </div>
        <asp:Label ID="Label5" runat="server" Text="Test" Font-Bold="True" Font-Size="Large"></asp:Label>

    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="ECarRental.OrderHistory" %>

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
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <div class="row">

                            <div class="col d-flex justify-content-center">
                                <img class="img-fluid" id="imgview" width="100" src="imgs/generaluser.png" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label for="" class="form-label">First Name</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ReadOnly="true" ID="FName" runat="server"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="" class="form-label">Last Name</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ReadOnly="true" ID="LName" runat="server"></asp:TextBox>

                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md">
                                <label for="" class="form-label">Username</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ReadOnly="true" ID="Username" runat="server"></asp:TextBox>

                                </div>

                            </div>
                            <div class="col-md-6">
                                <label for="" class="form-label">Email</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ReadOnly="true" ID="Email" runat="server"></asp:TextBox>

                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label for="" class="form-label">Address</label>
                                    <asp:TextBox ID="Address" class="form-control" ReadOnly="true" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="col-md-8">
                <div class="row">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [order].OrderId, [order].DateTime, [order].Subtotal, [order].Username, order_details.Quantity, cars.name, cars.image, order_details.Id, cars.id AS ProductId FROM [order] INNER JOIN order_details ON [order].OrderId = order_details.OrderId INNER JOIN cars ON order_details.ProductId = cars.id
WHERE [order].userId=@userId">
                        <SelectParameters>
                            <asp:Parameter Name="userId" Type="String" DefaultValue='0' />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="col">
                        <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-lg-6">

                                                    <div class="row">
                                                        <div class="col-12">
                                                            Order Id -
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("OrderId") %>' Font-Bold="True" Font-Size="Large"></asp:Label>
                                                            &nbsp;| Product Name - 
                                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("name") %>' Font-Bold="True" Font-Size="Large"></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-12">
                                                            Date and Time -
                                               <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("DateTime") %>'></asp:Label>
                                                            &nbsp;| Subtotal -
                                               <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("Subtotal") %>'></asp:Label>

                                                        </div>
                                                    </div>


                                                    <div class="row">
                                                        <div class="col-12">
                                                            Username&nbsp; -
                                               <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("Username") %>'></asp:Label>

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
            </div>

        </div>

    </div>
</asp:Content>

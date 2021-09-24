<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ECarRental.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-9 ">

                <div class="row">
                    <div class="col d-flex justify-content-between">
                        <div>
                        <h4><b>Shopping Cart</b></h4>
                            </div>
                        <div class="d-flex flex-row">
                        <asp:Label ID="Label11" runat="server" Text="" Font-Bold="true" Font-Size="Larger" class="me-2"></asp:Label>
                        <asp:Label ID="Label12" runat="server" Text="Item(s)" Font-Bold="true" Font-Size="Larger" ></asp:Label>
                            </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <hr />
                    </div>
                </div>



                <div class="row">
                    <div class="col">
                        <asp:GridView ID="GridView1" runat="server" class="table " AutoGenerateColumns="False" ShowHeader="False">


                            <Columns>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="container-fluid">
                                            <div class="row">

                                                <div class="col-lg-6">

                                                    <div class="row mt-2">


                                                        <div class="col-lg-5">
                                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("id") %>' Font-Bold="True" Font-Size="Large" Visible="False"></asp:Label>
                                                            <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("image") %>' />
                                                        </div>

                                                        <div class="col-lg-7">

                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>' Font-Bold="True" Font-Size="Large"></asp:Label>

                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Category -
                                               <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("category") %>'></asp:Label>
                                                                    &nbsp;|
                                                                    <button runat="server" id="Button1" class="btn btn-mini text-danger" title="Remove" onserverclick="binClicked">
                                                                        <i class="fas fa-trash"></i>
                                                                    </button>

                                                                </div>
                                                            </div>


                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Description&nbsp; -
                                               <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("description") %>'></asp:Label>

                                                                </div>
                                                            </div>
                                                        </div>


                                                    </div>

                                                </div>

                                                <div class="col-lg-6">
                                                    <div class="row h-100">

                                                        <div class="col-md-4 d-flex justify-content-start align-items-center flex-column">

                                                            <h4 class="ms-4 text-secondary">Quantity</h4>
                                                            <div class="d-flex flex-row justify-content-start align-items-center">
                                                                <button runat="server" id="minusBtn" class="btn btn-mini" title="Subtract" onserverclick="minusClicked">
                                                                    <i class="fas fa-minus"></i>
                                                                </button>
                                                                <asp:TextBox ID="TextBox1" runat="server" Width="50" Text="1" class="text-center form-control"></asp:TextBox>
                                                                <button runat="server" id="plusBtn" class="btn btn-mini mb-1" title="Add" onserverclick="plusClicked">
                                                                    <i class="fas fa-plus "></i>
                                                                </button>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-4 d-flex justify-content-start align-items-center flex-column">
                                                            <div>
                                                                <h4 class="text-secondary">Price</h4>
                                                            </div>
                                                            <div>
                                                                <b>$</b>
                                                                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("price") %>' Font-Size="Large"></asp:Label>
                                                            </div>

                                                        </div>

                                                        <div class="col-md-4  d-flex justify-content-start align-items-center flex-column">
                                                            <div>
                                                                <h4 class="text-secondary">Total</h4>
                                                            </div>
                                                            <div>
                                                                <b>$</b>
                                                                <asp:Label ID="Label7" runat="server" Text="9000" Font-Bold="True" Font-Size="Large"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </ItemTemplate>

                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                    </div>

                </div>

                <div class="row">
                    <div class="col">
                        <div class="d-flex">

                            <a class="text-decoration-none" href="Product.aspx"><i class="fas fa-long-arrow-alt-left fa-3x"></i></a>
                            <a class="text-decoration-none" href="Product.aspx">
                                <h4 class="mt-2 ms-3">Continue Shopping</h4>
                            </a>
                        </div>

                    </div>

                </div>



            </div>


            <div class="col-md-3">

                <div class="row">
                    <div class="col">
                        <h4><b>Order Summary</b></h4>
                    </div>
                </div>



                <div class="row">
                    <div class="col">
                        <hr />
                    </div>
                </div>

                <div class="row">
                    <div class="col d-flex justify-content-between align-items-center flex-row ">
                        <div class="d-flex flex-row">
                            <asp:Label ID="Label9" runat="server" Text="Item(s)" Font-Size="Large"></asp:Label>
                            <asp:Label ID="Label8" runat="server" Text="3" Font-Size="Large" class="ms-3"></asp:Label>
                        </div>
                        <div>
                            <b>$</b>
                            <asp:Label ID="Label5" runat="server" Text="9000" Font-Size="Larger"></asp:Label>
                        </div>
                    </div>
                    
                </div>

                <div class="row mt-3">
                    <div class="col">
                        <h5>Shipping</h5>
                    </div>
                </div>

                <div class="row mt-1">
                    <div class="col">
                        <asp:DropDownList class="form-control" placeholder="" ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" >
                            <asp:ListItem Text="Standard Delivery - $3500" Value="3500"> </asp:ListItem>
                            <asp:ListItem Text="Express Delivery - $6500" Value="6500"> </asp:ListItem>
                        </asp:DropDownList>

                    </div>

                </div>

                <div class="row mt-3">
                    <div class="col">
                        <h5>Promo Code</h5>
                    </div>
                </div>

                <div class="row mt-1">
                    <div class="col">
                        <asp:TextBox class="form-control" ID="TextBox2" runat="server" placeholder="Enter your code here"></asp:TextBox>
                    </div>

                </div>

                <div class="row mt-3">
                    <div class="col">
                        <button type="button" class="btn btn-warning">APPLY</button>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <hr />
                    </div>
                </div>

                <div class="row">
                    <div class="col d-flex justify-content-between align-items-center flex-row ">
                        <div>
                            <h5 class="mt-2">Grand Total</h5>
                        </div>
                        <div>
                            <b>$</b>
                            <asp:Label ID="Label6" runat="server" Text="0" Font-Size="Larger"></asp:Label>
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col mt-3">
                        <button type="button" class="btn btn-primary form-control">Checkout</button>
                    </div>

                </div>

            </div>

        </div>
    </div>


</asp:Content>

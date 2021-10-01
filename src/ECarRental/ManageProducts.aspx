<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageProducts.aspx.cs" Inherits="ECarRental.ManageProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        //function takes the input 
        function readURL(input) {
            //check if theres files and index[0]
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    //setting src tag for the component with the imgview tag
                    $('#imgview').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">

                            <div class="col d-flex justify-content-center">
                                <img class="img-fluid" id="imgview" width="100" src="imgs/manage.png" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="ErrorMessage" />
                        </p>
                        <asp:ValidationSummary runat="server" class="text-danger" />

                        <div class="row">
                            <div class="col-md-6">
                                <label for="" class="form-label">Product ID</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" placeholder="111" ID="ProductID" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="Update" runat="server" ControlToValidate="ProductID"
                                        class="text-danger" ErrorMessage="The Product ID field is required." />
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="" class="form-label">Product Name</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" placeholder="Altima" ID="Name" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="Add" runat="server" ControlToValidate="Name"
                                        class="text-danger" ErrorMessage="The Product Name field is required." />
                                </div>
                            </div>
                        </div>





                        <div class="row">
                            <div class="col-md">
                                <label for="" class="form-label">Price</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" placeholder="5000" ID="Price" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="Add" runat="server" ControlToValidate="Price"
                                        class="text-danger" ErrorMessage="The Price field is required." />
                                </div>

                            </div>
                            <div class="col-md-6">
                                <label for="" class="form-label">Category</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" placeholder="Toyota" ID="Category" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="Add" runat="server" ControlToValidate="Category"
                                        class="text-danger" ErrorMessage="The Category field is required." />
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label for="" class="form-label">Description</label>
                                    <asp:TextBox ID="Description" class="form-control" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="Add" runat="server" ControlToValidate="Description"
                                        class="text-danger" ErrorMessage="The Description field is required." />
                                </div>
                            </div>
                        </div>




                        <div class="row mt-2">
                            <div class="col">
                                <div class="form-group">
                                     <label for="" class="form-label">Image Upload</label>
                                    <asp:FileUpload ID="FileUpload1" onchange="readURL (this);" class="form-control" runat="server" />
                                    <asp:RequiredFieldValidator ValidationGroup="Add" runat="server" ControlToValidate="FileUpload1"
                                    class="text-danger" ErrorMessage="An image is required." />
                                </div>
                                
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md">
                                <asp:Button class="btn btn-success form-control mt-2" runat="server" ID="Button2" Text="Add" OnClick="Add_Clicked" ValidationGroup="Add" />
                                <asp:Button class="btn btn-warning form-control mt-2" runat="server" ID="Button3" Text="Update" OnClick="Update_Clicked" ValidationGroup="Update" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="col-md-7">
                <div class="row">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT * FROM [cars]"></asp:SqlDataSource>
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
                                                        <div class="col-12 btn-group-sm">
                                                            <asp:Button class="btn btn-danger mt-2" runat="server" ID="Button1" Text="Remove" OnClick="Delete_Clicked" />
                                                            <asp:Button class="btn btn-primary mt-2" runat="server" ID="Button4" Text="Edit" OnClick="Edit_Clicked" />
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

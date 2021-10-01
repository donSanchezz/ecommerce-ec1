<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="ECarRental.ManageUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        $(document).ready(function () {
            $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
       
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">

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
                                    <asp:TextBox class="form-control" ReadOnly="true"  ID="FName" runat="server"></asp:TextBox>
                                    
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
                                    <asp:TextBox class="form-control" ReadOnly="true"  ID="Username" runat="server"></asp:TextBox>
                                   
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [Id], [FirstName], [LastName], [Address], [Email], [PhoneNumber], [UserName] FROM [AspNetUsers]">
                    </asp:SqlDataSource>
                    <div class="col">
                        <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>

        </div>

    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ECarRental.Account.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">

                <%--Card--%>
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="../imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Register</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <%--Signup Form--%>
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="ErrorMessage" />
                        </p>
                        <asp:ValidationSummary runat="server" class="text-danger" />
                        <div class="row">
                            <div class="col-md-6">
                                <label for="" class="form-label">First Name</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" placeholder="John" ID="FirstName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName"
                                        class="text-danger" ErrorMessage="The First Name field is required." />
                                </div>

                            </div>

                            <div class="col-md-6">
                                <label for="" class="form-label">Last Name</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" placeholder="Doe" ID="LastName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="LastName"
                                        class="text-danger" ErrorMessage="The Last Name field is required." />
                                </div>
                            </div>

                        </div>



                        <div class="row">

                             <div class="col-md-6">
                                <label for="" class="form-label">Username</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" placeholder="JohnDoe" ID="Username" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Username"
                                        class="text-danger" ErrorMessage="The Username field is required." />
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="" class="form-label">Contact Number </label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" placeholder="8761234567" TextMode="Number" ID="ContactNum" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ContactNum"
                                        class="text-danger" ErrorMessage="The Contact Number field is required." />
                                </div>
                            </div>

                            
                        </div>
                        <div class="row">

                              <div class="col-md-6">
                                <label for="" class="form-label">Email</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" placeholder="johndoe@gmail.com" TextMode="Email" ID="Email" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                        class="text-danger" ErrorMessage="The Email field is required." />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="" class="form-label">Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" placeholder="Address" ID="Address" runat="server" Rows="5"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Address"
                                        class="text-danger" ErrorMessage="The Full Address field is required." />
                                </div>
                            </div>


                          
                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <label for="" class="form-label">Password</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" placeholder="Password" TextMode="Password" ID="Password" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                        class="text-danger" ErrorMessage="The password field is required." />
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="" class="form-label">Confirm Password</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" placeholder="Confirm Password" TextMode="Password" ID="ConfirmPassword" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                                        class="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                                    <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                        class="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                                </div>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col">

                                <div class="d-grid gap-2 form-group mt-2">
                                    <a href="usersignup.aspx">
                                        <asp:Button runat="server" OnClick="Register_Click" Text="Register" class="form-control btn btn-success btn-lg" />
                                    </a>
                                </div>


                            </div>
                        </div>

                    </div>
                </div>
            </div>



        </div>










    </div>




</asp:Content>

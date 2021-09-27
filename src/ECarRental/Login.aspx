<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ECarRental.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">

                <%--Card--%>
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Login</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                            <p class="text-danger">
                                <asp:Literal runat="server" ID="FailureText" />
                            </p>
                        </asp:PlaceHolder>
                        <%--Login Form--%>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="Email" class="col-md-2 control-label">Email</asp:Label>
                                    <div class="col-md">
                                        <asp:TextBox runat="server" ID="Email" class="form-control" TextMode="Email" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                            class="text-danger" ErrorMessage="The email field is required." />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="Password" class="col-md-2 control-label">Password</asp:Label>
                                    <div class="col-md">
                                        <asp:TextBox runat="server" ID="Password" TextMode="Password" class="form-control" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" class="text-danger" ErrorMessage="The password field is required." />
                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-md-offset-2 col-md">
                                        <div class="checkbox">
                                            <asp:CheckBox runat="server" ID="RememberMe" />
                                            <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mt-2">
                                    <div class="col-md-offset-2 col-md">
                                        <asp:Button runat="server" OnClick="LogIn"  class="form-control btn btn-success btn-lg" Text="Log in" />
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>

               
            </div>

        </div>

    </div>
</asp:Content>

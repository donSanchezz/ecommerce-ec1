<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="ECarRental.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 d-flex flex-column">
                <div class="row">
                    <img src="imgs/error.svg" alt="globe" width="200" height="130" />
                </div>
                <div class="row">
                    <center>
                    <h2>Oops</h2>
                        </center>
                </div>
                <div class="row">
                    <p>Something went wrong with our system, a log has been taken, but please provide us with a report of what happened.</p>
                </div>
            </div>

            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-6">
                        <label for="" class="form-label">Full Name </label>
                        <div class="form-group">
                            <asp:TextBox class="form-control" placeholder="John Doe" ID="TextBox1" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">Email Address </label>
                        <div class="form-group">
                            <asp:TextBox class="form-control" placeholder="Email" ID="TextBox3" runat="server"></asp:TextBox>
                        </div>
                    </div>

                </div>
                <div class="row mt-2">

                    <div class="col-md-6">
                        <label for="" class="form-label">Subject</label>
                        <div class="form-group">
                            <asp:TextBox class="form-control" placeholder="Subject" ID="TextBox4" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label for="" class="form-label">Parish</label>
                        <div class="form-group">
                            <asp:DropDownList class="form-control" placeholder="" ID="DropDownList1" runat="server">
                                <asp:ListItem Text="Kingston" Value="Kingston"> </asp:ListItem>
                                <asp:ListItem Text="St. Andrew" Value="St. Andrew"> </asp:ListItem>
                                <asp:ListItem Text="Portland" Value="Portland"> </asp:ListItem>
                                <asp:ListItem Text="St. Thomas" Value="St. Thomas"> </asp:ListItem>
                                <asp:ListItem Text="St. Catherine" Value="St. Catherine"> </asp:ListItem>
                                <asp:ListItem Text="St. Mary" Value="St. Mary"> </asp:ListItem>
                                <asp:ListItem Text="St. Ann" Value="St. Ann"> </asp:ListItem>
                                <asp:ListItem Text="Manchester" Value="Manchester"> </asp:ListItem>
                                <asp:ListItem Text="Clarendon" Value="Clarendon"> </asp:ListItem>
                                <asp:ListItem Text="Hanover" Value="Hanover"> </asp:ListItem>
                                <asp:ListItem Text="Westmoreland" Value="Westmoreland"> </asp:ListItem>
                                <asp:ListItem Text="St. James" Value="St. James"> </asp:ListItem>
                                <asp:ListItem Text="Trelawny" Value="Trelawny"> </asp:ListItem>
                                <asp:ListItem Text="St. Elizabeth" Value="St. Elizabeth"> </asp:ListItem>
                            </asp:DropDownList>
                        </div>

                    </div>

                </div>

                <div class="row">
                    <div class="col-md-12">
                        <label for="" class="form-label">Message</label>
                        <div class="form-group">
                            <textarea class="form-control" rows="4"></textarea>
                        </div>

                    </div>
                </div>

                <div class="row mt-2">
                    <div class="form-group col-md-12 text-center">
                        <button type="submit" class="btn btn-primary"><i class="fas fa-paper-plane"></i>&nbsp;&nbsp;Send Messsage</button>

                    </div>

                </div>

            </div>
        </div>

    </div>

    </div>
</asp:Content>

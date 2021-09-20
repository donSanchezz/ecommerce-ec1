<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ECarRental.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Featured Products--%>
    <section class="section-height">
        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <%-- <div class="carousel-item active" style="background-image:url(imgs/img-1.jpg);">--%>
                <div class="carousel-item active">
                    <img src="imgs/img-1.jpg" class="d-block w-100 tales" alt="suv">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>SUVs</h5>
                        <p>Drive comfortably in our wide range of SUVs from Chevy Equinox to VW Tiguan.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="imgs/img-4.jpg" class="d-block w-100 tales" alt="sedan">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Sedans</h5>
                        <p>Great speed and style, check out our store listing for more.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="imgs/img-3.jpg" class="d-block w-100 tales" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Hatchbacks</h5>
                        <p>Great for long trips with friends and family.</p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </section>
    <%--! Featured Products--%>

    <%--About Us--%>
    <section class="mt-2" id="AboutUs">
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col mt-2">
                            <center>
                                <h4>About Us</h4>
                            </center>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <hr />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                        </div>

                    </div>


                </div>
                <div class="col-md-6 d-flex justify-content-center">
                    <img class="svg-img mt-3" src="imgs/team.svg" alt="team" />
                </div>

            </div>

        </div>

    </section>
    <%--About Us--%>


    <%--Contact Us--%>
    <section id="ContactUs">
        <div class="container mt-5">
            <div class="row">
                <div class="row">
                    <div class="col">
                        <center>
                            <h4>Contact Us</h4>
                        </center>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <hr />
                    </div>
                </div>
                <div class="col-md-5">

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




                <div class="col-md-2">
                    <h5>Call Us / WhatsApp</h5>
                    <p>
                        <a href="tel:+8761234567"><i class="fas fa-phone"></i>+(876) 1234567</a><br />
                    </p>

                    <h5 class="mt-4">Email </h5>
                    <p>
                        <a href="mailto:gonowrentals@gmail.com"><i class="fas fa-envelope"></i>gonowrental@gmail.com</a>
                        <br />
                    </p>

                    <h5 class="mt-4">Working hours</h5>
                    <p>
                        Mon - Fri: 9am - 5PM(EST)
                    </p>

                    <h5 class="mt-3">Address </h5>
                    <p>
                        2 Union Square, Kingston
                    </p>
                </div>

                <div class="col-md-5">
                    <div class="embed-responsive embed-responsive-21by9">
                        <iframe class="embed-responsive-item" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1595.4534656264268!2d-76.78758667374488!3d17.995049491599563!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8edb3fa27f90f9d7%3A0xd82152a8d0c9aff1!2sDrug%20Serv%20Pharmacy!5e0!3m2!1sen!2sjm!4v1631922193170!5m2!1sen!2sjm" width="500" height="370" style="border: 0;" allowfullscreen="" loading="lazy"></iframe>
                    </div>
                </div>
            </div>


        </div>

    </section>



</asp:Content>

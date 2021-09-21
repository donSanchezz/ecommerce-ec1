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

                <div class="col-md-5">
                    <div class="row">
                        <div class="col">
                            <h5>Who We Are</h5>

                        </div>

                    </div>

                    <div class="row mt-4">
                        <div class="col">
                            Welcome. It's great that you're thinking about using our service. But first, you should learn a little about who we are and what we stand for. Go Now Rentals is a family-owned, world-class car rental service. We operate a island wide network that covers  all 14 parishes, nearly 150  dedicated team members, and nearly 400 vehicles taking customers wherever they need to go. In any way you want to think about it, we lead the transportation service industry.How did we get here? The fact is, we owe our success to each and every one of our people. That's why we empower everyone on our team with opportunities for growth. Our mission, along with our uncompromising commitment to customers, has made Go Now a genuine success story and a truly special place to work.
                        </div>

                    </div>




                </div>
                <div class="col-md-7">

                    <div class="row">
                        <div class="col">
                            <h5>Our Mission</h5>

                        </div>

                    </div>

                    <div class="row mt-3">
                        <div class="col">
                            <img src="imgs/world.svg" alt="globe" width="200" height="130" />
                            <h5>To be the best transportation service provider on the island.</h5>

                        </div>

                        <div class="col">
                            <img src="imgs/review.svg" alt="review" width="200" height="130" />
                            <h5>To exceed our customers’ expectations for service, quality and value.</h5>

                        </div>

                        <div class="col">
                            <img src="imgs/workspace.svg" alt="workspace" width="200" height="130" />
                            <h5>To provide our employees with a great place to work.</h5>

                        </div>

                    </div>
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

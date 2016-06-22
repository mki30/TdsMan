<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OpenAuthProviders.ascx.cs" Inherits="OpenAuthProviders" %>

<div id="socialLoginList">
    <a class="ebBtnz" id="editLinkBtn" href="/account/edititem.aspx?type=updatepassword" rel="nofollow">Change Password</a>     
    <asp:ListView runat="server" ID="providerDetails" ItemType="System.String"
        SelectMethod="GetProviderNames" ViewStateMode="Disabled">
        <ItemTemplate>
            <button type="submit" class="ebBtnz <%#: Item.ToLower()=="facebook"?"fbConnect":"goConnect" %>" name="provider" value="<%#: Item %>"
                title="Log in using your <%#: Item %> account.">
                <i></i>
                <span>Login with <%#: Item %></span>
            </button>
        </ItemTemplate>
    </asp:ListView>

</div>

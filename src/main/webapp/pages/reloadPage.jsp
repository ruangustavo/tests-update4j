<%@ taglib prefix="s" uri="/struts-tags" %>
<script>
    let msgAlert = '<s:property value="msgAlert" />'
    if (msgAlert.length > 0) {
        alert(HtmlDecode(msgAlert));
    }
    window.location = "/sms";

    function HtmlEncode(s) {
        return $('<div>').text(s).html();
    }

    function HtmlDecode(s) {
        return $('<div>').html(s).text();
    }
</script>
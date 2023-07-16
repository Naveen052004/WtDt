function profile(){   
    let cookies = document.cookie.split("; ");
    for (let i = 0; i < cookies.length; i++) {
        let cookie = cookies[i].split("=");
        if (cookie[0] === "name") {
            document.getElementById("profile").innerHTML = cookie[1].substring(0, cookie[1].indexOf('@'));
        }
    }
}
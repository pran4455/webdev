// realTimeSearch.js - jQuery Real-Time Search with Highlighting

$(document).ready(function () {
    $("#searchInput").on("keyup", function () {
        let searchText = $(this).val().toLowerCase();
        $(".article").each(function () {
            let articleText = $(this).text().toLowerCase();
            if (articleText.includes(searchText)) {
                $(this).show();
                let regex = new RegExp(searchText, "gi");
                $(this).html($(this).text().replace(regex, (match) => `<span class='highlight'>${match}</span>`));
            } else {
                $(this).hide();
            }
        });
    });
});

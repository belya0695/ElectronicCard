$(document).ready(function () {

    $('input[type=radio][name=search]').change(function () {
        if (this.value == 'search-by-date') {
            $("#date-search").show();
            $("#diagnosis-search").hide();
            $("#post-search").hide();
        }
        else if (this.value == 'search-by-diagnosis') {
            $("#date-search").hide();
            $("#diagnosis-search").show();
            $("#post-search").hide();
        }
        else if (this.value == 'search-by-post') {
            $("#date-search").hide();
            $("#diagnosis-search").hide();
            $("#post-search").show();
        }
    });
});
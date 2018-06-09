window.JsonClass = function (urlSearchByDate, urlSearchByDiagnosis, urlSearchByPost) {
    var _urlSearchByDate = urlSearchByDate;
    var _urlSearchByDiagnosis = urlSearchByDiagnosis;
    var _urlSearchByPost = urlSearchByPost;
    var _inProgress = false;

    function _makeCall(urlReq, reqData, callback) {
        if (!_inProgress) {
            $.ajax({
                type: "Get",
                url: urlReq,
                data: reqData,
                beforeSend: function () {
                    _inProgress = true;
                },
                success: function (result) {
                    callback(result);
                },
                error: function (e) {
                    console.log(e);
                },
                complete: function () {
                    _inProgress = false;
                }
            });
        }
    }

    function SearchByDate() {
        var callback = function (result) {
            var label = $("#search-result");
            label.html(result);
        };
        var date = $("#date").val();
        var data = "date=" + date;
        _makeCall(_urlSearchByDate, data, callback);
    }

    function SearchByDiagnosis() {
        var callback = function (result) {
            var label = $("#search-result");
            label.html(result);
        };
        var diagnosis = $("#diagnosis").val();
        var data = "diagnosis=" + diagnosis;
        _makeCall(_urlSearchByDiagnosis, data, callback);
    }

    function SearchByPost() {
        var callback = function (result) {
            var label = $("#search-results");
            label.html(result);
        };
        var name = $("#name").val();
        var data = "name=" + name;
        _makeCall(_urlSearchByPost, data, callback);
    }


    return {
        SearchByDate: SearchByDate,
        SearchByDiagnosis: SearchByDiagnosis,
        SearchByPost: SearchByPost

    };
};
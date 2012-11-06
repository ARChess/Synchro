var clickedOnce = 0;
var selectedPieceX = -1, selectedPieceY = -1;
var toSpaceX = -1, toSpaceY = -1;
var currentPlayer = "";

function clickPiece(x, y, enabled, isWhite) {
    if(enabled == true) {
        if(clickedOnce == 0 && !isWhite) {
            $("#piece-" + x + "-" + y).css("border", "3px solid blue");
            $("#cancelButton").removeClass("disabled");
            clickedOnce = 1;
            selectedPieceX = x;
            selectedPieceY = y;
        } else {
            if(clickedOnce == 1 && !(x == selectedPieceX && y == selectedPieceY)) {
                $("#piece-" + x + "-" + y).css("border", "3px solid red");
                $("#confirmButton").removeClass("disabled");
                clickedOnce = 2;
                toSpaceX = x;
                toSpaceY = y;
            }
        }
    }
}

function cancel() {
    clickedOnce = 0;
    
    $("#piece-" + selectedPieceX + "-" + selectedPieceY).css("border", "none");
    $("#piece-" + toSpaceX + "-" + toSpaceY).css("border", "none");

    $("#cancelButton").addClass("disabled");
    $("#confirmButton").addClass("disabled");
    
    selectedPieceX = -1;
    selectedPieceY = -1;
    toSpaceX = -1;
    toSpaceY = -1;
}

function submit(pieces, id) {
    var data = {
        "game_state": {
            "black": {
                "pawn1": { "x": -1, "y": -1 },
                "pawn2": { "x": -1, "y": -1 },
                "pawn3": { "x": -1, "y": -1 },
                "pawn4": { "x": -1, "y": -1 },
                "pawn5": { "x": -1, "y": -1 },
                "pawn6": { "x": -1, "y": -1 },
                "pawn7": { "x": -1, "y": -1 },
                "pawn8": { "x": -1, "y": -1 },
                "rook1": { "x": -1, "y": -1 },
                "rook2": { "x": -1, "y": -1 },
                "bishop1": { "x": -1, "y": -1 },
                "bishop2": { "x": -1, "y": -1 },
                "knight1": { "x": -1, "y": -1 },
                "knight2": { "x": -1, "y": -1 },
                "queen": { "x": -1, "y": -1 },
                "king": { "x": -1, "y": -1 }
            },
            "white": {
                "pawn1": { "x": -1, "y": -1 },
                "pawn2": { "x": -1, "y": -1 },
                "pawn3": { "x": -1, "y": -1 },
                "pawn4": { "x": -1, "y": -1 },
                "pawn5": { "x": -1, "y": -1 },
                "pawn6": { "x": -1, "y": -1 },
                "pawn7": { "x": -1, "y": -1 },
                "pawn8": { "x": -1, "y": -1 },
                "rook1": { "x": -1, "y": -1 },
                "rook2": { "x": -1, "y": -1 },
                "bishop1": { "x": -1, "y": -1 },
                "bishop2": { "x": -1, "y": -1 },
                "knight1": { "x": -1, "y": -1 },
                "knight2": { "x": -1, "y": -1 },
                "queen": { "x": -1, "y": -1 },
                "king": { "x": -1, "y": -1 }
            }
        }
    };
    
    for(var i = 0; i < 8; ++i) {
        for(var j = 0; j < 8; ++j) {
            if(pieces[""+i][""+j] != undefined) {
                var color = pieces[""+i][""+j].split("_")[0];
                var piece = pieces[""+i][""+j].split("_")[1];
                if(toSpaceX == i && toSpaceY == j) {
                    data["game_state"][color][piece]["x"] = -1;
                    data["game_state"][color][piece]["y"] = -1;
                } if(selectedPieceX == i && selectedPieceY == j) {
                    data["game_state"][color][piece]["x"] = toSpaceX;
                    data["game_state"][color][piece]["y"] = toSpaceY;
                } else {
                    data["game_state"][color][piece]["x"] = i;
                    data["game_state"][color][piece]["y"] = j;
                }
            }
        }
    }
    
    data = JSON.stringify(data, null, 0);

    $.ajax({
        beforeSend: function(xhrObj){
            xhrObj.setRequestHeader("API_KEY","traprubepreyed2ebupucramunumus4ebewruyUdraga36pacrujavuKep8afref");
        },
        url: "/api?identifier=Synchro-" + id,
        type: "PUT",
        contentType: "application/json",
        data: data,
        error: function(XMLHttpRequest, textStatus, errorThrown){
            alert(errorThrown);
        }, 
        success: function(data, textStatus, XMLHttpRequest){
            document.location.reload(true);
        }
    });
}

window.setInterval(function() {
    $.ajax({
        beforeSend: function(xhrObj){
            xhrObj.setRequestHeader("API_KEY","traprubepreyed2ebupucramunumus4ebewruyUdraga36pacrujavuKep8afref");
        },
        url: "/api?identifier=" + $("[class='btn btn-info disabled']")[1].innerText,
        type: "GET",
        contentType: "application/json",
        data: data,
        error: function(XMLHttpRequest, textStatus, errorThrown){
            alert(errorThrown);
        }, 
        success: function(data, textStatus, XMLHttpRequest){
            data = JSON.parse(data);
            if(currentPlayer == "") {
                currentPlayer = data["current_player"];
            } else if(data["current_player"] != currentPlayer) {
                document.location.reload(true);
            }
        }
    });
},6000);



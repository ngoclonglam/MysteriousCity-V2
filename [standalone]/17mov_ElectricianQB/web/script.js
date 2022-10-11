let PlayerIsHost = true 
let myId = 0
let myName
let mediumActive = false
let repeairingGameActive = false
let nextjob = false
let shouldGoMainMenu = false

$(document).keyup(function (e) {
    if (e.key === "Escape") {
        if (shouldGoMainMenu) {
            $(".cloakroomMenu").fadeOut(250)
            $(".closestPlayers").fadeOut(250)
            $(".tutorial").fadeOut(250)
            $(".WorkMenu").fadeIn(250)
            $(".diffPick").fadeOut(250)
            shouldGoMainMenu = false
            return
        }
        if (!repeairingGameActive) {
            FocusOff()
        }
    }
});

window.addEventListener('message', function (event) {
    let action = event.data.action;
    if (action == "OpenWorkMenu") {
        $(".WorkMenu").fadeIn(250)
        shouldGoMainMenu = false
        nextjob = false
    } else if (action == "hideCloakroom") {
        $("#Cloakroom").fadeOut(0)
    } else if (action == "OpenDifficulties") {
        diffMenu(true)
        nextjob = true
    } else if (action == "ShowInviteBox") {
        let name = event.data.name
        $("#inviteUser").text(name)
        $(".inviteBox").fadeIn(250)
    } else if (action == "showTutorial") {
        if (!nextjob) {
            $(".tutorial").fadeIn(250)
        }
    } else if (action == "Init") {
        myName = event.data.name
        myId = event.data.myId
        $(".partyContainer").empty()
        $(".WorkMenu .flex").empty()
        $(".WorkMenu .flex").append('<div class="partyChild childHost" id="' + Number(1+1) + '" plyId="' + myId + ' onclick="Kick(' + myId + ')"><div class="partyHost"><i class="fa-regular fa-user"></i>' + myName + '</div></div>')
        $(".partyContainer").append('<div class="partyChild" onclick="Invite()"><div class="freeSlot"><i class="fa-solid fa-user-plus"></i></div></div>')
    } else if (action == "refreshMugs") {
        let names = event.data.names
        myId = event.data.myId
        $(".partyContainer").empty()
        $(".WorkMenu .flex").empty()
        let added = 0
        for (i = 0; i < names.length; i++) {
            added = added + 1
            let p

            if (names[i].isHost) {
                $(".WorkMenu .flex").append('<div class="partyChild childHost" id="' + Number(i+1) + '" plyId="' + names[i].id + '" onclick="Kick(' + names[i].id + ')"><div class="partyHost"><i class="fa-regular fa-user"></i>' + names[i].name + '</div></div>')
            } else {
                $(".partyContainer").append('<div class="partyChild" id="' + Number(i+1) + '" plyId="' + names[i].id + '" onclick="Kick(' + names[i].id + ')"><div class="busySlot"><div class="xmark">❌</div>' + names[i].name + '</div></div>')
            }
        }

        for (i = 0; i < 1-added; i++) {
            $(".partyContainer").append('<div class="partyChild" onclick="Invite()"><div class="freeSlot"><i class="fa-solid fa-user-plus"></i></div></div>')
        }
    } else if (action == "HostStatusUpdate") {
        PlayerIsHost = event.data.status
    } else if (action == "showCounter") {
        $(".counter span").text(0 + "%");
        $(".counter").fadeIn(250);
    } else if (action == "hideCounter") {
        $(".counter").fadeOut(250);
    } else if (action == "updateCounter") {
        $(".counter span").text(event.data.value.toString() + "%");
    } else if (action == "showRepeairing") {
        $(".repeairingGame").css("display","block").fadeIn(250);
        repeairingGameActive = true
    }
});

function CloseTutorial() {
    $(".tutorial").fadeOut(250)
    FocusOff()
}


function cloakroom() {
    shouldGoMainMenu = true
    $(".WorkMenu").fadeOut(250)
    $(".cloakroomMenu").fadeIn(250)
}

function citizenClothes() {
    shouldGoMainMenu = false
    $(".cloakroomMenu").fadeOut(250)
    $(".WorkMenu").fadeIn(250)
    $.post(`https://${GetParentResourceName()}/changeClothes`, JSON.stringify({ type: "citizen" }));
}

function workClothes() {
    shouldGoMainMenu = false
    $(".cloakroomMenu").fadeOut(250)
    $(".WorkMenu").fadeIn(250)
    $.post(`https://${GetParentResourceName()}/changeClothes`, JSON.stringify({ type: "work" }));
}

function pickPlayers(id) {
    shouldGoMainMenu = false
    $(".closestPlayers").fadeOut(250)
    $(".WorkMenu").fadeIn(250)
    $.post(`https://${GetParentResourceName()}/sendRequest`, JSON.stringify({ id: id }));
    $.post(`https://${GetParentResourceName()}/notify`, JSON.stringify({ msg: "Invite Sent!" }));
}

function Kick(target) {
    if (target != undefined && target != 0) {
        if (PlayerIsHost) {
            if (myId == target) {
                $.post(`https://${GetParentResourceName()}/notify`, JSON.stringify({ msg: "The owner of the team can not leave it!" }));
                return
            }
            $(".partyChild[plyId='" + target + "']").text()
            $.post(`https://${GetParentResourceName()}/kickPlayerFromLobby`, JSON.stringify({ id: target, name: $(".partyChild[plyId='" + target + "']").text() }));
            $(".partyChild[plyId='" + target + "']").remove();
            $(".partyContainer").append('<div class="partyChild" onclick="Invite()"><div class="freeSlot"><i class="fa-solid fa-user-plus"></i></div></div>')
        } else if (myId == target) {
            $.post(`https://${GetParentResourceName()}/leaveLobby`, JSON.stringify({ id: myId }));
            return
        }
    }
}

function Invite() {
    fetch(`https://${GetParentResourceName()}/GetClosestPlayers`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
    }).then(resp => resp.json()).then(resp => {
        let table = resp
        if (table.length != 0) {
            shouldGoMainMenu = true
            $(".WorkMenu").fadeOut(250)
            $(".closestPlayers .flex2").empty()
            for (i = 0; i < table.length; i++) {
                $(".closestPlayers .flex2").append('<div class="button" onclick="pickPlayers(' + table[i].id + ')">'+ table[i].name + ' | ' + table[i].id + '</div>')
            }
            $(".closestPlayers").fadeIn(250)
        }
    })
}

function reactRequest(boolean) {
    $(".inviteBox").fadeOut(250)
    FocusOff()
    $.post(`https://${GetParentResourceName()}/requestReacted`, JSON.stringify({ boolean: boolean }));
}

function FocusOff() {
    $(".cloakroomMenu").fadeOut(250)
    $(".WorkMenu").fadeOut(250)
    $(".closestPlayers").fadeOut(250)
    $(".tutorial").fadeOut(250)
    $(".diffPick").fadeOut(250)
    $.post(`https://${GetParentResourceName()}/focusOff`);
}

function startJob() {
    if (PlayerIsHost) {
        $.post(`https://${GetParentResourceName()}/startJob`);
        FocusOff()
    } else {
        $.post(`https://${GetParentResourceName()}/notify`, JSON.stringify({ msg: "Only owner of the party can start job!" }));
    }
}

function diffMenu(showCancel) {
    fetch(`https://${GetParentResourceName()}/GetMyLevel`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
    }).then(resp => resp.json()).then(resp => {
        let table = resp
        $(".Difficulties").empty()
        for (i = 0; i < table.length; i++) {
            let p = `<div class="button" onclick="pickDiff('${table[i].toLowerCase()}')">${table[i]}</div>`
            $(".Difficulties").append(p)
        }

        if (showCancel) {
            let p = `<div class="button" onclick="pickDiff('close')">Close</div>`
            $(".Difficulties").append(p)
        }
        $(".WorkMenu").fadeOut(250)
        $(".diffPick").fadeIn(250)
        shouldGoMainMenu = true
    })
}

function pickDiff(pickedString) {
    if (PlayerIsHost) {
        if (pickedString == 'close') {
            FocusOff()
            return
        } 
        $.post(`https://${GetParentResourceName()}/startJob`, JSON.stringify({ diff: pickedString, nextjob: nextjob }));
    } else {
        $.post(`https://${GetParentResourceName()}/notify`, JSON.stringify({ msg: "Only owner of the party can start job!" }));
    }
    $(".diffPick").fadeOut(250)
    FocusOff()
}

// Repeairing

let completedLights = [0, 0, 0, 0];

new Draggable('.drag-1', {
  onDrag: function () { updateLine('.line-1', this.x + 120, this.y + 185); },
  onRelease: function () {
    if (this.x !== 670 || this.y !== 188 ) {
      reset('.drag-1', '.line-1', 70, 185);
      toggleLight(2, false);
    } else if (this.x === 670 && this.y === 188) toggleLight(2, true)
  },
  liveSnap: {points: [{x: 670, y: 188}],radius: 20}
});
new Draggable('.drag-2', {
  onDrag: function () { updateLine('.line-2', this.x + 120, this.y + 375); },
  onRelease: function () {
    if (this.x !== 670 || this.y !== -188 ) {
      reset('.drag-2', '.line-2', 60, 375);
      toggleLight(1, false);
    } else if (this.x === 670 && this.y === -188) toggleLight(1, true)
  },
  liveSnap: {points: [{x: 670, y: -188}],radius: 20}
});
new Draggable('.drag-3', {
  onDrag: function () { updateLine('.line-3', this.x + 120, this.y + 560); },
  onRelease: function () {
    if (this.x !== 670 || this.y !== 0 ) {
      reset('.drag-3', '.line-3', 60, 560);
      toggleLight(3, false);
    } else if (this.x === 670 && this.y === 0) toggleLight(3, true)
  },
  liveSnap: {points: [{x: 670, y: 0}],radius: 20}
});
new Draggable('.drag-4', {
  onDrag: function () { updateLine('.line-4', this.x + 120, this.y + 745); },
  onRelease: function () {
    if (this.x !== 670 || this.y !== 0 ) {
      reset('.drag-4', '.line-4', 60, 745);
      toggleLight(4, false);
    } else if (this.x === 670 && this.y === 0) toggleLight(4, true)
  },
  liveSnap: {points: [{x: 670, y: 0}],radius: 20}
});

function updateLine(selector, x, y) {
  gsap.set(selector, {
    attr: {
      x2: x,
      y2: y
    }
  });
}

function toggleLight(selector, visibility) {
  if (visibility) {
    completedLights[selector - 1] = 1;
    if (completedLights[0] === 1 && completedLights[1] === 1 && completedLights[2] === 1 && completedLights[3] === 1) {
      audioTask.play();
      window.setTimeout(() => {
        reset('.drag-1', '.line-1', 70, 185);
        reset('.drag-2', '.line-2', 60, 375);
        reset('.drag-3', '.line-3', 60, 560);
        reset('.drag-4', '.line-4', 60, 745);
        toggleLight(2, false);
        toggleLight(1, false);
        toggleLight(3, false);
        toggleLight(4, false);

        $(".repeairingGame").css("display","none").fadeOut(250);
        repeairingGameActive = false
        $.post(`https://${GetParentResourceName()}/finishRepeairing`, JSON.stringify({
            succes: true,
        }));

      }, 2000);

    }
  } else {
    completedLights[selector - 1] = 0;
  }

  gsap.to(`.light-${selector}`, {
    opacity: visibility ? 1 : 0,
    duration: 0.3
  });
}

function reset(drag, line, x, y) {
  gsap.to(drag, {
    duration: 0.3,
    ease: 'power2.out',
    x: 0,
    y: 0
  });
  gsap.to(line, {
    duration: 0.3,
    ease: 'power2.out',
    attr: {
      x2: x,
      y2: y
    }
  });
}

const audioTask = new Audio
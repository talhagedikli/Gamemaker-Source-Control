event_inherited();
switch (state) {
    case WeponStates.idle:
        self.idle();
        break;
    case WeponStates.reload:
        self.reload();
        break;
    case WeponStates.attack:
        self.attack();
        break;
    default:
        show("state not matching");
        break;
}

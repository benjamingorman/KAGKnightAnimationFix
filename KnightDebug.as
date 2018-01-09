#include "Logging.as";
#include "KnightCommon.as";

string GetKnightStateName(CBlob@ this) {
    KnightInfo@ knight;
    this.get("knightInfo", @knight);

    u8 state = knight.state;
    if (state == KnightStates::normal)
        return "normal";
    else if (state == KnightStates::shielding)
        return "shielding";
    else if (state == KnightStates::shielddropping)
        return "shielddropping";
    else if (state == KnightStates::shieldgliding)
        return "shieldgliding";
    else if (state == KnightStates::sword_drawn)
        return "sword_drawn";
    else if (state >= KnightStates::sword_cut_mid && state <= KnightStates::sword_cut_down)
        return "sword_cut";
    else if (state == KnightStates::sword_power)
        return "sword_power";
    else if (state == KnightStates::sword_power_super)
        return "sword_power_super";
    else
        return "unknown knight state";
}

void onTick(CBlob@ this) {
    KnightInfo@ knight;
    this.get("knightInfo", @knight);

    log("onTick", "state: " + GetKnightStateName(this) + 
            ", swordTimer: " + knight.swordTimer + 
            ", doubleslash: " + knight.doubleslash +
            ", slideTime: " + knight.slideTime +
            ", position: (" + this.getPosition().x + ", " + this.getPosition().y + ")" +
            ", gender: " + this.getPlayer().getSex() +
            ", head: " + this.getPlayer().getHead() 
       );
    /*
    log("onTick", "position (" + this.getPosition().x + ", " + this.getPosition().y + ")" +
            ", velocity (" + this.getVelocity().x + ", " + this.getVelocity().y);
            */
}

// CreateFogModifierRectBJ(enabled: boolean, whichPlayer: player, whichFogState: fogstate, r: rect): fogmodifier
_G.CreateFogModifierRectBJ = function (enabled: boolean, whichPlayer: player, whichFogState: fogstate, r: rect): void {
    return;
};

_G.bj_QUESTTYPE_OPT_DISCOVERED = 2;
_G.bj_QUESTTYPE_REQ_DISCOVERED = 1;
interface Quest {
    questType: number;
    title: string;
    description: string;
    iconPath: string;
}
const Quests: Quest[] = [];

_G.CreateQuestBJ = function (questType: number, title: string, description: string, iconPath: string): Quest {
    const q: Quest = { questType, title, description, iconPath };

    Quests.push(q);
    return q;

};

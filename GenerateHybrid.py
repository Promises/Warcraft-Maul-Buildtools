import datetime
import json
import os
import sys
import re

class Quest:
    def __init__(self, title, icon, stype, body):
        self.title = title
        self.icon = icon
        self.stype = stype
        self.body = body

    def __str__(self):
        return self.title

    def __repr__(self):
        return str(self)

    def asquest(self):
        return f'	call CreateQuestBJ(%s, "Reimagined %s", "%s", "%s")' % (
                self.stype, self.title, self.body, self.icon)




def get_all_quests():
    quest_list = list()
    files = os.listdir('scripts/Quests')
    files = [file for file in files if '.md' in file]
    files = sorted(files)
    for f in files:
        with open(os.path.join('scripts/Quests', f)) as file:
            lines = file.read().splitlines()
            header = list()
            body = list()
            title = ""
            icon = "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp"
            type = "bj_QUESTTYPE_REQ_DISCOVERED"
            shouldread = False
            readbody = False
            for line in lines:
                if line.find('---') is not -1:
                    if(shouldread):
                        readbody = True
                    shouldread = True
                elif(shouldread):
                    if(readbody):
                        if len(body) > 0 or len(line) > 0:
                            body.append(line)
                    else:
                        if line.find('title:') is not -1:
                            title = re.findall("^.*'(.*)'.*$", line)[0]
                        if line.find('icon:') is not -1:
                            icon = re.findall("^.*'(.*)'.*$", line)[0]
                        if line.find('type:') is not -1:
                            intype = re.findall("^.*'(.*)'.*$", line)[0]
                            if intype is 'required':
                                type = "bj_QUESTTYPE_REQ_DISCOVERED"

                        header.append(line)

            create_quest(title, icon, type, body, [0], quest_list)

    template = list()

    with open('scripts/quests_template.j') as f:
        template = f.read().splitlines()

    stripped_list = list(map(str.strip, template))
    pivot = stripped_list.index("{{GENERATE}}")
    spaces = len(template[pivot]) - len("{{GENERATE}}")
    spacer = " " * spaces

    generated_quest_list = list()

    for quest in quest_list:
        generated_quest_list.append(spacer + quest.asquest())

    generated_quest_list.reverse()
    generated_library = template[0:pivot - 1]
    generated_library += generated_quest_list
    generated_library += template[pivot + 1:]

    with open('scripts/Quests.j', 'w') as f:
        for item in generated_library:
            f.write("%s\n" % item)


def create_quest(title, icon, type, body, number, quest_list):
    s = '\\n'
    if len(s.join(body)) >= 1000:
        q_a, q_b = split_quest(body)
        number[0] += 1
        create_quest(title, icon, type, q_a, number, quest_list)
        number[0] += 1
        create_quest(title, icon, type, q_b, number, quest_list)
    else:
        if number[0] is not 0:
            title = title + ' - ' + str(number[0])
        quest_list.append(Quest(title, icon, type, s.join(body)))



def split_quest(quest_body):

    indices = [i for i, x in enumerate(quest_body) if x.find('Updates') != -1]
    if len(indices) >= 2:
        q_a = quest_body[indices[0]:indices[1]]
        q_b = quest_body[indices[1]:]
        return q_a, q_b
    else:
        half = int(len(quest_body) / 2)
        q_a = quest_body[0:half]
        q_b = [q_a[0]]
        q_b = q_b + quest_body[half:]
        return q_a, q_b






def get_buildnum_with_date(spacer):
    buildnum = "NaN"

    x = datetime.datetime.now()

    if len(sys.argv) > 1:
        buildnum = sys.argv[1]

    generated_list = list()
    generated_list.append(
        spacer + 'call Utility_DisplayMessageToAllPlayers("Welcome to'
                 ' Warcraft Maul Reimagined")')

    generated_list.append(spacer +
                          f'call Utility_DisplayMessageToAllPlayers("'
                          f'This is build: %s, built %s.")' % (
                              buildnum, x.strftime("%b %d %Y")))




    return generated_list


def main():
    data = {}

    builders = dict()

    weeiz = ['e00I']

    numbers = ['One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight',
               'Nine']

    tier_limits = [15, 99, 149, 299, 399, 499, 699, 899, 0]

    tier_towers = list()
    template = list()

    with open('scripts/hybrid_template.j') as f:
        template = f.read().splitlines()

    stripped_list = list(map(str.strip, template))
    pivot = stripped_list.index("{{GENERATE}}")
    spaces = len(template[pivot]) - len("{{GENERATE}}")
    spacer = " " * spaces

    generated_hybrid_list = list()

    hybrid_towers = dict()
    with open('units.json') as json_data:
        data = json.load(json_data)
        json_data.close()

    for builder in data:
        # print(builder['UnitFunc']['UnitId'] + ' - ' + builder['UnitFunc']['Name'])
        builders[builder['UnitFunc']['UnitId']] = builder

    for i in weeiz:
        for tower in builders[i]["Builds"]:
            hybrid_towers[tower["UnitFunc"]["UnitId"]] = tower
        # print(i)

    for tier in range(0, len(tier_limits)):
        towers = list()
        if tier + 1 is len(tier_limits):
            for tower in list(hybrid_towers.keys()):
                towers.append(hybrid_towers.pop(tower, None))
        else:
            for tower in list(hybrid_towers.keys()):
                if int(hybrid_towers[tower]['SLKUnit']['UnitBalance'][
                           'Goldcost']) <= tier_limits[tier]:
                    towers.append(
                        hybrid_towers.pop(tower, None))

        tier_towers.append(towers)

    for tier in range(0, len(tier_limits)):
        # set udg_TierOneTowers[0] = 'h00Z' // Dragonkin
        tier_string = numbers[tier]
        generated_hybrid_list.append(
            spacer + "//========== TIER: " + tier_string)

        for tower in tier_towers[tier]:
            number_in_tier = tier_towers[tier].index(tower)
            unit_id = tower["UnitFunc"]["UnitId"]
            unit_name = tower["UnitFunc"]["Name"]
            sttest = f"set udg_Tier%sTowers[%d] = '%s' // %s" % (
                tier_string, number_in_tier, unit_id, unit_name)
            generated_hybrid_list.append(spacer + sttest)

        generated_hybrid_list.append(spacer + f"set udg_Tier%sSize = %d" % (
            tier_string, len(tier_towers[tier]) - 1))

    generated_library = template[0:pivot - 1]
    generated_library += get_buildnum_with_date(spacer)
    generated_library += generated_hybrid_list
    generated_library += template[pivot + 1:]

    with open('scripts/TestLib.j', 'w') as f:
        for item in generated_library:
            f.write("%s\n" % item)

    # print(data[0]["Builds"])
    get_all_quests()


if __name__ == "__main__":
    main()

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
        q = list()
        q.append('{')

        q.append(f'    title: `%s`,' % self.title)
        q.append(f'    icon: `%s`,' % self.icon)
        q.append(f'    stype: %s,' % self.stype)
        q.append(f'    body: `%s`,' % self.body)

        q.append('},')
        q.reverse()
        return q


def create_all_imports():
    base_path='scripts'
    folders = []
    for r, d, f in os.walk(base_path):
        for folder in d:
            exists = os.path.isfile(os.path.join(r, folder, 'ignore_import.j'))
            if not exists:
                folders.append(os.path.join(r, folder))


    template = list()

    with open('scripts/Templates_GEN/imports_template.j') as f:
        template = f.read().splitlines()


    stripped_list = list(map(str.strip, template))
    pivot = stripped_list.index("{{GENERATE}}")


    for folder in folders:
        filelist = os.listdir(folder)
        to_be_imported = list()

        for file in filelist:

            if file[len(file)-2:] == '.j' and file != 'imports.j':

                to_be_imported.append('//! import vjass \"'+file+'"')

        folder_imports = template[0:pivot - 1]
        folder_imports += to_be_imported
        folder_imports += template[pivot + 1:]

        with open(os.path.join(folder, 'imports.j'), 'w') as f:
            for item in folder_imports:
                f.write("%s\n" % item)
    
    with open('scripts/Templates_GEN/imports_root_template.j') as f:
        template = f.read().splitlines()


    stripped_list = list(map(str.strip, template))
    pivot = stripped_list.index("{{GENERATE}}")

    to_be_imported = list()

    for folder in folders:
        to_be_imported.append('//! import vjass \"'+folder.replace(base_path+'/','')+'/imports.j"')

    filelist = os.listdir(base_path)

    for file in filelist:

        if file[len(file) - 2:] == '.j' and file != 'imports.j' and file != 'main.j':
            to_be_imported.append('//! import vjass \"' + file + '"')

    folder_imports = template[0:pivot - 1]
    folder_imports += to_be_imported
    folder_imports += template[pivot + 1:]

    with open(os.path.join(base_path, 'imports.j'), 'w') as f:
        for item in folder_imports:
            f.write("%s\n" % item)





def get_all_quests():
    quest_list = list()
    files = os.listdir('Quests')
    files = [file for file in files if '.md' in file]
    files = sorted(files)
    for f in files:
        with open(os.path.join('Quests', f)) as file:
            lines = file.read().splitlines()
            header = list()
            body = list()
            title = ""
            icon = "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp"
            type = "bj_QUESTTYPE_REQ_DISCOVERED"
            shouldread = False
            readbody = False
            for line in lines:
                if line.find('---') != -1:
                    if(shouldread):
                        readbody = True
                    shouldread = True
                elif(shouldread):
                    if(readbody):
                        if len(body) > 0 or len(line) > 0:
                            body.append(line)
                    else:
                        if line.find('title:') != -1:
                            title = re.findall("^.*'(.*)'.*$", line)[0]
                        if line.find('icon:') != -1:
                            icon = re.findall("^.*'(.*)'.*$", line)[0]
                        if line.find('type:') != -1:
                            intype = re.findall("^.*'(.*)'.*$", line)[0]
                            if intype == 'required':
                                type = "bj_QUESTTYPE_REQ_DISCOVERED"

                        header.append(line)

            create_quest(title, icon, type, body, [0], quest_list)

    template = list()

    with open('templates/questsGEN.ts.template') as f:
        template = f.read().splitlines()

    stripped_list = list(map(str.strip, template))
    pivot = stripped_list.index("{{GENERATE}}")
    spaces = len(template[pivot]) - len("{{GENERATE}}")
    spacer = " " * spaces

    generated_quest_list = list()

    for quest in quest_list:
        for line in quest.asquest():
            generated_quest_list.append(spacer + line)

    generated_quest_list.reverse()
    generated_library = template[0:pivot - 1]
    generated_library += generated_quest_list
    generated_library += template[pivot + 1:]

    with open('app/src/Generated/questsGEN.ts', 'w') as f:
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
        if number[0] != 0:
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






def get_buildnum_with_date():
    buildnum = "NaN"

    x = datetime.datetime.now()

    if len(sys.argv) > 1:
        buildnum = sys.argv[1]

    generated_list = list()
    generated_list.append(f'export const BUILD_DATE: string = "%s";' % (x.strftime("%b %d %Y")))

    generated_list.append(f'export const BUILD_NUMBER: string = "%s";' % buildnum)




    with open('app/src/Generated/Version.ts', 'w') as f:
        for item in generated_list:
            f.write("%s\n" % item)


def main():
    if not os.path.exists('app/src/Generated/'):
        os.makedirs('app/src/Generated/')
    data = {}

    builders = dict()

    weeiz = ['e00I']

    numbers = ['One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight',
               'Nine']

    tier_limits = [15, 99, 149, 299, 399, 499, 699, 899, 0]

    tier_towers = list()
    template = list()
    get_buildnum_with_date()
    with open('templates/hybridRandom.ts.template') as f:
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
    print(len(hybrid_towers))
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
            spacer + "export const HybridTier" + tier_string + ": HybridTower[] = [")

        for tower in tier_towers[tier]:
            number_in_tier = tier_towers[tier].index(tower)
            unit_id = tower["UnitFunc"]["UnitId"]
            unit_name = tower["UnitFunc"]["Name"][1:len(tower["UnitFunc"]["Name"])-1]
            sttest = "    { id: '"+unit_id+"', name: `"+unit_name+"` }, // " + unit_name
            generated_hybrid_list.append(spacer + sttest)

        generated_hybrid_list.append(spacer + "];")

    generated_library = template[0:pivot - 1]
    generated_library += generated_hybrid_list
    generated_library += template[pivot + 1:]

    with open('app/src/Generated/hybridRandomGEN.ts', 'w') as f:
        for item in generated_library:
            f.write("%s\n" % item)

    # print(data[0]["Builds"])
    get_all_quests()

    # create_all_imports()


if __name__ == "__main__":
    main()

import datetime
import json
import sys


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

    weeiz = ['e00I', 'e001']

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


if __name__ == "__main__":
    main()

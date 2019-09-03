import { BUILD_DATE, BUILD_NUMBER } from './Generated/Version';

export class InitConfig {
    public static run(): void {
        const message: string = `Welcome to Warcraft Maul.\n` +
            `This is build: ${BUILD_NUMBER}, built ${BUILD_DATE}.\n` +
            `Visit us on ${Util.ColourString('#7ab1df', 'https://maulbot.com/')} ` +
            Util.ColourString('#ccb896', `for the latest version and our discord channel.`);

        const chatbox: framehandle = BlzGetFrameByName('ChatTextArea', 0);
        BlzFrameSetText(chatbox, Util.ColourString('#ccb896', message));
        BlzFrameSetVertexColor(chatbox, BlzConvertColor(255, 0, 0, 0));
    }
}

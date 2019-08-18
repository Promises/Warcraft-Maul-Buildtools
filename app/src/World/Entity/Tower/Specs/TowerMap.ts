export class TowerMap<K, V> extends Map<K, V> {
    public duplicateKeys: K[] = [];
    private _keyArray: K[] = [];

    public add = (key: K, value: V): Map<K, V> => {
        if (this.has(key)) {
            this.duplicateKeys.push(key);
            return this;
        }
        this._keyArray.push(key);
        return this.set(key, value);
    };

    public GetArray(): K[] {
        return this._keyArray;
    }
}

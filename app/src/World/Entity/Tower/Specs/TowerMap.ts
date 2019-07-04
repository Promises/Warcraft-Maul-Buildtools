export class TowerMap<K, V> extends Map<K, V> {
    public duplicateKeys: K[] = [];

    public add = (key: K, value: V): Map<K, V> => {
        if (this.has(key)) {
            this.duplicateKeys.push(key);
            return this;
        }
        return this.set(key, value);
    }
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.inbloom.content.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.inbloom.content.domain.Party;

privileged aspect Party_Roo_Json {
    
    public String Party.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public String Party.toJson(String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").serialize(this);
    }
    
    public static Party Party.fromJsonToParty(String json) {
        return new JSONDeserializer<Party>().use(null, Party.class).deserialize(json);
    }
    
    public static String Party.toJsonArray(Collection<Party> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static String Party.toJsonArray(Collection<Party> collection, String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<Party> Party.fromJsonArrayToPartys(String json) {
        return new JSONDeserializer<List<Party>>().use(null, ArrayList.class).use("values", Party.class).deserialize(json);
    }
    
}

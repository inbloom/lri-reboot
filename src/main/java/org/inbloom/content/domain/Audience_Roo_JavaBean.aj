// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.inbloom.content.domain;

import java.util.Set;
import org.inbloom.content.domain.Audience;
import org.inbloom.content.domain.Resource;

privileged aspect Audience_Roo_JavaBean {
    
    public String Audience.getName() {
        return this.name;
    }
    
    public void Audience.setName(String name) {
        this.name = name;
    }
    
    public Set<Resource> Audience.getResource() {
        return this.resource;
    }
    
    public void Audience.setResource(Set<Resource> resource) {
        this.resource = resource;
    }
    
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.inbloom.content.domain;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.inbloom.content.domain.LearningResource;
import org.inbloom.content.domain.LearningResourceDataOnDemand;
import org.springframework.stereotype.Component;

privileged aspect LearningResourceDataOnDemand_Roo_DataOnDemand {
    
    declare @type: LearningResourceDataOnDemand: @Component;
    
    private Random LearningResourceDataOnDemand.rnd = new SecureRandom();
    
    private List<LearningResource> LearningResourceDataOnDemand.data;
    
    public LearningResource LearningResourceDataOnDemand.getNewTransientLearningResource(int index) {
        LearningResource obj = new LearningResource();
        setName(obj, index);
        return obj;
    }
    
    public void LearningResourceDataOnDemand.setName(LearningResource obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public LearningResource LearningResourceDataOnDemand.getSpecificLearningResource(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        LearningResource obj = data.get(index);
        Long id = obj.getId();
        return LearningResource.findLearningResource(id);
    }
    
    public LearningResource LearningResourceDataOnDemand.getRandomLearningResource() {
        init();
        LearningResource obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return LearningResource.findLearningResource(id);
    }
    
    public boolean LearningResourceDataOnDemand.modifyLearningResource(LearningResource obj) {
        return false;
    }
    
    public void LearningResourceDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = LearningResource.findLearningResourceEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'LearningResource' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<LearningResource>();
        for (int i = 0; i < 10; i++) {
            LearningResource obj = getNewTransientLearningResource(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}

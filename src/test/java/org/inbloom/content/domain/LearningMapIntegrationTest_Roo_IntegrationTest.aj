// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.inbloom.content.domain;

import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.inbloom.content.domain.LearningMap;
import org.inbloom.content.domain.LearningMapDataOnDemand;
import org.inbloom.content.domain.LearningMapIntegrationTest;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect LearningMapIntegrationTest_Roo_IntegrationTest {
    
    declare @type: LearningMapIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: LearningMapIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: LearningMapIntegrationTest: @Transactional;
    
    @Autowired
    LearningMapDataOnDemand LearningMapIntegrationTest.dod;
    
    @Test
    public void LearningMapIntegrationTest.testCountLearningMaps() {
        Assert.assertNotNull("Data on demand for 'LearningMap' failed to initialize correctly", dod.getRandomLearningMap());
        long count = LearningMap.countLearningMaps();
        Assert.assertTrue("Counter for 'LearningMap' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void LearningMapIntegrationTest.testFindLearningMap() {
        LearningMap obj = dod.getRandomLearningMap();
        Assert.assertNotNull("Data on demand for 'LearningMap' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'LearningMap' failed to provide an identifier", id);
        obj = LearningMap.findLearningMap(id);
        Assert.assertNotNull("Find method for 'LearningMap' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'LearningMap' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void LearningMapIntegrationTest.testFindAllLearningMaps() {
        Assert.assertNotNull("Data on demand for 'LearningMap' failed to initialize correctly", dod.getRandomLearningMap());
        long count = LearningMap.countLearningMaps();
        Assert.assertTrue("Too expensive to perform a find all test for 'LearningMap', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<LearningMap> result = LearningMap.findAllLearningMaps();
        Assert.assertNotNull("Find all method for 'LearningMap' illegally returned null", result);
        Assert.assertTrue("Find all method for 'LearningMap' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void LearningMapIntegrationTest.testFindLearningMapEntries() {
        Assert.assertNotNull("Data on demand for 'LearningMap' failed to initialize correctly", dod.getRandomLearningMap());
        long count = LearningMap.countLearningMaps();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<LearningMap> result = LearningMap.findLearningMapEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'LearningMap' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'LearningMap' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void LearningMapIntegrationTest.testFlush() {
        LearningMap obj = dod.getRandomLearningMap();
        Assert.assertNotNull("Data on demand for 'LearningMap' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'LearningMap' failed to provide an identifier", id);
        obj = LearningMap.findLearningMap(id);
        Assert.assertNotNull("Find method for 'LearningMap' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyLearningMap(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'LearningMap' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void LearningMapIntegrationTest.testMergeUpdate() {
        LearningMap obj = dod.getRandomLearningMap();
        Assert.assertNotNull("Data on demand for 'LearningMap' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'LearningMap' failed to provide an identifier", id);
        obj = LearningMap.findLearningMap(id);
        boolean modified =  dod.modifyLearningMap(obj);
        Integer currentVersion = obj.getVersion();
        LearningMap merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'LearningMap' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void LearningMapIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'LearningMap' failed to initialize correctly", dod.getRandomLearningMap());
        LearningMap obj = dod.getNewTransientLearningMap(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'LearningMap' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'LearningMap' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'LearningMap' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void LearningMapIntegrationTest.testRemove() {
        LearningMap obj = dod.getRandomLearningMap();
        Assert.assertNotNull("Data on demand for 'LearningMap' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'LearningMap' failed to provide an identifier", id);
        obj = LearningMap.findLearningMap(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'LearningMap' with identifier '" + id + "'", LearningMap.findLearningMap(id));
    }
    
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.inbloom.content.domain;

import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.inbloom.content.domain.Pathway;
import org.inbloom.content.domain.PathwayDataOnDemand;
import org.inbloom.content.domain.PathwayIntegrationTest;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PathwayIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PathwayIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PathwayIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: PathwayIntegrationTest: @Transactional;
    
    @Autowired
    PathwayDataOnDemand PathwayIntegrationTest.dod;
    
    @Test
    public void PathwayIntegrationTest.testCountPathways() {
        Assert.assertNotNull("Data on demand for 'Pathway' failed to initialize correctly", dod.getRandomPathway());
        long count = Pathway.countPathways();
        Assert.assertTrue("Counter for 'Pathway' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PathwayIntegrationTest.testFindPathway() {
        Pathway obj = dod.getRandomPathway();
        Assert.assertNotNull("Data on demand for 'Pathway' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Pathway' failed to provide an identifier", id);
        obj = Pathway.findPathway(id);
        Assert.assertNotNull("Find method for 'Pathway' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Pathway' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void PathwayIntegrationTest.testFindAllPathways() {
        Assert.assertNotNull("Data on demand for 'Pathway' failed to initialize correctly", dod.getRandomPathway());
        long count = Pathway.countPathways();
        Assert.assertTrue("Too expensive to perform a find all test for 'Pathway', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Pathway> result = Pathway.findAllPathways();
        Assert.assertNotNull("Find all method for 'Pathway' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Pathway' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PathwayIntegrationTest.testFindPathwayEntries() {
        Assert.assertNotNull("Data on demand for 'Pathway' failed to initialize correctly", dod.getRandomPathway());
        long count = Pathway.countPathways();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Pathway> result = Pathway.findPathwayEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Pathway' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Pathway' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void PathwayIntegrationTest.testFlush() {
        Pathway obj = dod.getRandomPathway();
        Assert.assertNotNull("Data on demand for 'Pathway' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Pathway' failed to provide an identifier", id);
        obj = Pathway.findPathway(id);
        Assert.assertNotNull("Find method for 'Pathway' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPathway(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Pathway' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PathwayIntegrationTest.testMergeUpdate() {
        Pathway obj = dod.getRandomPathway();
        Assert.assertNotNull("Data on demand for 'Pathway' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Pathway' failed to provide an identifier", id);
        obj = Pathway.findPathway(id);
        boolean modified =  dod.modifyPathway(obj);
        Integer currentVersion = obj.getVersion();
        Pathway merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Pathway' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PathwayIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Pathway' failed to initialize correctly", dod.getRandomPathway());
        Pathway obj = dod.getNewTransientPathway(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Pathway' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Pathway' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'Pathway' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void PathwayIntegrationTest.testRemove() {
        Pathway obj = dod.getRandomPathway();
        Assert.assertNotNull("Data on demand for 'Pathway' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Pathway' failed to provide an identifier", id);
        obj = Pathway.findPathway(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Pathway' with identifier '" + id + "'", Pathway.findPathway(id));
    }
    
}

/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */

package com.topcoder.direct.services.copilot.model;

import junit.framework.JUnit4TestAdapter;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>Tests <code>{@link CopilotProjectStatus}</code> class.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class CopilotProjectStatusTests {

    /**
     * <p>Represents instance of tested class.</p>
     */
    private CopilotProjectStatus instance;

    /**
     * <p>Returns test suite for this class.</p>
     *
     * @return test suite for this class
     */
    public static junit.framework.Test suite() {
        return new JUnit4TestAdapter(CopilotProjectStatusTests.class);
    }

    /**
     * <p>Sets up test environment.</p>
     *
     * @throws Exception if any error occurs
     */
    @Before
    public void setUp() throws Exception {

        instance = new CopilotProjectStatus();
    }

    /**
     * <p>Tests if <code>{@link CopilotProjectStatus}</code> class implements {@link java.io.Serializable}
     * interface.</p>
     */
    @Test
    public void testSerializable() {
        Assert.assertTrue("Class does not implements Serializable interface.",
                instance instanceof Serializable);
    }

    /**
     * <p>Tests if <code>{@link CopilotProjectStatus}</code> class extends {@link LookupEntity} class.</p>
     */
    @Test
    public void testInheritance() {
        Assert.assertTrue("Class does not extends LookupEntity class.",
                instance instanceof LookupEntity);
    }

    /**
     * <p>Tests <code>{@link CopilotProjectStatus#CopilotProjectStatus()}</code> constructor.</p>
     */
    @Test
    public void testCtor() {

        Assert.assertNotNull("Object not instantiated.", instance);
    }

    /**
     * <p>Tests <code>name</code> property, tests both <code>{@link CopilotProjectStatus#setName(String)}</code> and
     * <code>{@link CopilotProjectStatus#getName()}</code> methods.</p>
     */
    @Test
    public void testNameProperty() {
        Assert.assertNull("Property name should be null.", instance.getName());

        String name = "name";
        instance.setName(name);

        Assert.assertEquals("Invalid name property value.", name, instance.getName());
    }

    /**
     * <p>Tests <code>id</code> property, tests both <code>{@link CopilotProjectStatus#setId(long)}</code> and
     * <code>{@link CopilotProjectStatus#getId()}</code> methods.</p>
     */
    @Test
    public void testIdProperty() {
        Assert.assertEquals("Property id should be 0.", 0, instance.getId());

        long id = 10l;
        instance.setId(id);

        Assert.assertEquals("Invalid id property value.", id, instance.getId());
    }

    /**
     * <p>Tests <code>createUser</code> property, tests both <code>{@link
     * CopilotProjectStatus#setCreateUser(String)}</code>
     * and <code>{@link CopilotProjectStatus#getCreateUser()}</code> methods.</p>
     */
    @Test
    public void testCreateUserProperty() {
        Assert.assertNull("Property createUser should be null.", instance.getCreateUser());

        String createUser = "createUser";
        instance.setCreateUser(createUser);

        Assert.assertEquals("Invalid createUser property value.", createUser, instance.getCreateUser());
    }

    /**
     * <p>Tests <code>createDate</code> property, tests both <code>{@link
     * CopilotProjectStatus#setCreateDate(java.util.Date)}</code>
     * and <code>{@link CopilotProjectStatus#getCreateDate()}</code> methods.</p>
     */
    @Test
    public void testCreateDateProperty() {
        Assert.assertNull("Property createDate should be null.", instance.getCreateDate());

        Date createDate = new Date();
        instance.setCreateDate(createDate);

        Assert.assertEquals("Invalid createDate property value.", createDate, instance.getCreateDate());
    }

    /**
     * <p>Tests <code>modifyUser</code> property, tests both <code>{@link
     * CopilotProjectStatus#setModifyUser(String)}</code>
     * and <code>{@link CopilotProjectStatus#getModifyUser()}</code> methods.</p>
     */
    @Test
    public void testModifyUserProperty() {
        Assert.assertNull("Property modifyUser should be null.", instance.getModifyUser());

        String modifyUser = "modifyUser";
        instance.setModifyUser(modifyUser);

        Assert.assertEquals("Invalid modifyUser property value.", modifyUser, instance.getModifyUser());
    }

    /**
     * <p>Tests <code>modifyDate</code> property, tests both <code>{@link
     * CopilotProjectStatus#setModifyDate(Date)}</code>
     * and <code>{@link CopilotProjectStatus#getModifyDate()}</code> methods.</p>
     */
    @Test
    public void testModifyDateProperty() {
        Assert.assertNull("Property modifyDate should be null.", instance.getModifyDate());

        Date modifyDate = new Date();
        instance.setModifyDate(modifyDate);

        Assert.assertEquals("Invalid modifyDate property value.", modifyDate, instance.getModifyDate());
    }
}

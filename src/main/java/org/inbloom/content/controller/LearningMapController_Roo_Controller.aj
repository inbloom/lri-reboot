// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.inbloom.content.controller;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.inbloom.content.controller.LearningMapController;
import org.inbloom.content.domain.LearningMap;
import org.inbloom.content.domain.Standard;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect LearningMapController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String LearningMapController.create(@Valid LearningMap learningMap, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, learningMap);
            return "learningmaps/create";
        }
        uiModel.asMap().clear();
        learningMap.persist();
        return "redirect:/learningmaps/" + encodeUrlPathSegment(learningMap.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String LearningMapController.createForm(Model uiModel) {
        populateEditForm(uiModel, new LearningMap());
        return "learningmaps/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String LearningMapController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("learningmap", LearningMap.findLearningMap(id));
        uiModel.addAttribute("itemId", id);
        return "learningmaps/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String LearningMapController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("learningmaps", LearningMap.findLearningMapEntries(firstResult, sizeNo));
            float nrOfPages = (float) LearningMap.countLearningMaps() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("learningmaps", LearningMap.findAllLearningMaps());
        }
        return "learningmaps/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String LearningMapController.update(@Valid LearningMap learningMap, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, learningMap);
            return "learningmaps/update";
        }
        uiModel.asMap().clear();
        learningMap.merge();
        return "redirect:/learningmaps/" + encodeUrlPathSegment(learningMap.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String LearningMapController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, LearningMap.findLearningMap(id));
        return "learningmaps/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String LearningMapController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        LearningMap learningMap = LearningMap.findLearningMap(id);
        learningMap.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/learningmaps";
    }
    
    void LearningMapController.populateEditForm(Model uiModel, LearningMap learningMap) {
        uiModel.addAttribute("learningMap", learningMap);
        uiModel.addAttribute("standards", Standard.findAllStandards());
    }
    
    String LearningMapController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
